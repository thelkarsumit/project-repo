locals {
  names = [for machine in var.virtual_machines_northeurope.vms : machine["vm_name"]]
  rg_names = [for machine in var.virtual_machines_northeurope.vms : machine["resource_group_name"]]

}

data "azurerm_virtual_machine" "lab_vm" {
count = length(local.names)
 name = local.names[count.index]
 resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "VM-rule-availability-ne" {
  name = "Alert-AM-Prod-Subscription-VMAvailability-Critical-NorthEurope"
  resource_group_name = var.rg_name
  description         = "The metric allows you to track the pulse of your VMs—during expected behavior, the metric displays a value of 1. In response to any VM availability disruptions, the metric dips to a 0 for the duration of impact. "
  scopes              = toset(data.azurerm_virtual_machine.lab_vm[*].id)
  target_resource_type = "Microsoft.Compute/virtualMachines"
  target_resource_location = "North Europe"
  severity = var.severity
  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name = var.metric_name
    aggregation = var.time_aggregation_method
    operator = var.operator
    threshold = var.threshold
  }
  action {
    action_group_id = var.action_group_id
  }
  frequency = "PT5M"
}