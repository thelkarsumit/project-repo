resource "azurerm_monitor_scheduled_query_rules_alert_v2" "logical_disk_used_space_alert" {
  count = length(var.threshold)
  name                = "Alert-AM-Prod-Subscription-Linux-LogicalDiskUsedSpace-${var.severity_level[count.index]}"
  resource_group_name = var.rg_name
  location            = var.deploy_location

  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity[count.index]
  criteria {
    query                   = <<-QUERY
       Perf
| where ObjectName == 'Logical Disk' and CounterName == '% Used Space' and InstanceName !hasprefix "/snap" and InstanceName !hasprefix "/run" and InstanceName !hasprefix "/sys"
| summarize AggregatedValue = avg(CounterValue) by bin(TimeGenerated, 5m), Computer, InstanceName, _ResourceId
      
      QUERY
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.threshold[count.index]
    operator                = var.operator

    resource_id_column    = "_ResourceId"
    metric_measure_column = "AggregatedValue"
    dimension {
      name     = "Computer"
      operator = "Include"
      values   = ["*"]
    }
    dimension {
      name     = "InstanceName"
      operator = "Include"
      values   = ["*"]
    }
    failing_periods {
      minimum_failing_periods_to_trigger_alert = 4
      number_of_evaluation_periods             = 4
    }
  }
  auto_mitigation_enabled          = true
  workspace_alerts_storage_enabled = false
  description                      = var.description
  display_name                     = "Alert-AM-Prod-Subscription-Linux-LogicalDiskUsedSpace-${var.severity_level[count.index]}"
  enabled                          = true
  skip_query_validation            = false
  action{
  action_groups = [var.action_group_id]
}  
}





