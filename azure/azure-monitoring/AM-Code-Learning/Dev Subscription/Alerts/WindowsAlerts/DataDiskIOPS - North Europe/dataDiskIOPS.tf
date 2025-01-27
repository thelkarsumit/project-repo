locals {
  names = [for machine in var.virtual_machines_northeurope.vms : machine["vm_name"]]
  rg_names = [for machine in var.virtual_machines_northeurope.vms : machine["resource_group_name"]]
  os_types = [for machine in var.virtual_machines_northeurope.vms : machine["os_type"]]
}

data "azurerm_virtual_machine" "lab_vm" { 
 count = length(local.names)
 name = local.names[count.index]
 resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "data_disk_alert_dev-ne" {
  count = length(var.severity_level)
  name = "Alert-AM-Dev-Subscription-Windows-DataDiskIOPS-${var.severity_level[count.index]}-NorthEurope"
  resource_group_name = var.rg_name
  scopes = toset(data.azurerm_virtual_machine.lab_vm[*].id)
  description = var.description
  severity = var.severity[count.index]
  target_resource_location = "North Europe"
  target_resource_type = "Microsoft.Compute/virtualMachines"

  criteria {

    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name = var.metric_name
    aggregation = var.time_aggregation_method
    operator = var.operator
    threshold = var.threshold[count.index]

  }

  action {

    action_group_id = var.action_group_id

  }

  frequency = "PT5M"

}

 