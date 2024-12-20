locals {
  names    = [for machine in var.virtual_machines.vms : machine["vm_name"]]
  rg_names = [for machine in var.virtual_machines.vms : machine["resource_group_name"]]
  os_types = [for machine in var.virtual_machines.vms : machine["os_type"]]

}
data "azurerm_virtual_machine" "lab_vm" {
  count = length(local.names)

  name                = local.names[count.index]
  resource_group_name = local.rg_names[count.index]
}


resource "azurerm_monitor_data_collection_rule" "rule1" {

  name                = var.dcr_name
  location            = var.deploy_location
  resource_group_name = var.rg_name
  destinations {
    log_analytics {
      workspace_resource_id = var.workspace_resource_id
      name                  = "log-analytics"
    }
    log_analytics {
      workspace_resource_id = var.workspace_resource_id
      name                  = "log-analytics-event"
    }

  }

  data_flow {
    streams      = ["Microsoft-Perf"]
    destinations = ["log-analytics"]
  }
   data_flow {
    streams      = ["Microsoft-Event"]
    destinations = ["log-analytics-event"]
  }
  

  data_sources {
    performance_counter {
      streams                       = ["Microsoft-Perf", "Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers = [

        "\\Processor Information(_Total)\\% Processor Time",
        "\\Memory\\% Committed Bytes In Use",

        "\\Processor(_Total)\\% Processor Time",

        "\\Memory\\% Used Memory",
        "Memory\\Available Bytes",
        "\\Memory\\% Used Swap Space",
        "\\LogicalDisk(*)\\% Free Space",
        "\\Logical Disk(*)\\% Used Space",
         "Processor(*)\\% Processor Time",
        "\\LogicalDisk(_Total)\\Disk Transfers/sec"
  
      ]
      name = "datasource-perfcounter"
    }
    windows_event_log {

    streams = ["Microsoft-Event"]

    x_path_queries = ["System!*[System[(EventID=41 or EventID=1074 or EventID=6006 or EventID=6008 or EventID=7036)]]"]

    name = "datasource-wineventlog"

  }
  }

}


resource "azurerm_monitor_data_collection_rule_association" "dcra_association" {
  count                   = length(flatten(local.names))
  name                    = "DCR-VM"
  target_resource_id      = data.azurerm_virtual_machine.lab_vm[count.index].id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.rule1.id
  description             = "Association between the Data Collection Rule and the Windows VM."


}

