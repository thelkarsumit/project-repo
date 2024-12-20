resource "azurerm_monitor_scheduled_query_rules_alert_v2" "alert_v2" {
  count = length(var.threshold)
  name                = "Alert-AM-Dev-Subscription-Linux-CpuUtilization-${var.severity_level[count.index]}"
  resource_group_name = var.rg_name
  location            = var.deploy_location

  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity[count.index]
  criteria {
    query                   = <<-QUERY
      Perf
        | where ObjectName == "Processor" and CounterName == "% Processor Time" and InstanceName == "total"
        | project TimeGenerated, Computer, CounterValue, _ResourceId     
      
      QUERY
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.threshold[count.index]
    operator                = var.operator

    resource_id_column    = "_ResourceId"
    metric_measure_column = "CounterValue"
    dimension {
      name     = "Computer"
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
  display_name                     = "Alert-AM-Dev-Subscription-Linux-CpuUtilization-${var.severity_level[count.index]}"
  enabled                          = true

  skip_query_validation            = false
  action{
  action_groups = [var.action_group_id]
}
 
  
}





