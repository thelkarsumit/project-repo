resource "azurerm_monitor_scheduled_query_rules_alert_v2" "CPUPercentage-container" {
  count = length(var.threshold)
  name                = "Alert-AM-Dev-Subscription-AKS-Container-CPU-Percentage-${var.severity_level[count.index]}"
  resource_group_name = var.rg_name
  location            = var.deploy_location
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity[count.index]
  criteria {
    query                   = <<-QUERY
      Perf

  | where ObjectName == 'K8SContainer'

  | where CounterName == "cpuUsageNanoCores"

  | summarize UsageValue = max(CounterValue) by Computer, CounterName

  | project Computer,UsageValue

  | join kind=leftouter (

  Perf

  | where ObjectName == 'K8SContainer'

  | where CounterName == "cpuLimitNanoCores"

  | summarize LimitValue = max(CounterValue) by Computer, CounterName, _ResourceId

  | project Computer,LimitValue, CounterName,_ResourceId

  ) on Computer

| project Computer, UsagePercent = UsageValue * 100.0 / LimitValue, _ResourceId, CounterName

| project  Computer, UsagePercent, _ResourceId, CounterName

QUERY
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.threshold[count.index]
    operator                = var.operator
    resource_id_column    = "_ResourceId"
    metric_measure_column = "UsagePercent"
    dimension {
      name     = "Computer"
      operator = "Include"
      values   = ["*"]
    }
    failing_periods {
      minimum_failing_periods_to_trigger_alert = 1
      number_of_evaluation_periods             = 1
    }
  }
  auto_mitigation_enabled          = true
  workspace_alerts_storage_enabled = false
  description                      = var.description
  display_name                     = "Alert-AM-Dev-Subscription-AKS-Container-CPU-Percentage-${var.severity_level[count.index]}"
  enabled                          = true
  skip_query_validation            = false
  action{
  action_groups = [var.action_group_id]
} 
}