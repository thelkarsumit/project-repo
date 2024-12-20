resource "azurerm_monitor_scheduled_query_rules_alert_v2" "average_node_cpu_percentage_alert" {
  count = length(var.threshold)
  name                = "Alert-AM-Dev-Subscription-AKS-Average-Node-CPU-Percentage-${var.severity_level[count.index]}"
  resource_group_name = var.rg_name
  location            = var.deploy_location
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity[count.index]
  criteria {
    query                   = <<-QUERY
      let endDateTime = now();
      let startDateTime = ago(1h);
      let trendBinSize = 1m;
      let capacityCounterName = 'cpuCapacityNanoCores';
      let usageCounterName = 'cpuUsageNanoCores';
      KubeNodeInventory
      | where TimeGenerated < endDateTime
      | where TimeGenerated >= startDateTime
      | distinct ClusterName, Computer, _ResourceId
      | join hint.strategy=shuffle (
        Perf
        | where TimeGenerated < endDateTime
        | where TimeGenerated >= startDateTime
        | where ObjectName == 'K8SNode'
        | where CounterName == capacityCounterName
        | summarize LimitValue = max(CounterValue) by Computer, CounterName, bin(TimeGenerated, trendBinSize)
        | project Computer, CapacityStartTime = TimeGenerated, CapacityEndTime = TimeGenerated + trendBinSize, LimitValue
      ) on Computer
      | join kind=inner hint.strategy=shuffle (
        Perf
        | where TimeGenerated < endDateTime + trendBinSize
        | where TimeGenerated >= startDateTime - trendBinSize
        | where ObjectName == 'K8SNode'
        | where CounterName == usageCounterName
        | project Computer, UsageValue = CounterValue, TimeGenerated
      ) on Computer
      | where TimeGenerated >= CapacityStartTime and TimeGenerated < CapacityEndTime
      | project ClusterName, Computer, TimeGenerated, UsagePercent = UsageValue * 100.0 / LimitValue, _ResourceId
      | summarize AggregatedValue = avg(UsagePercent) by bin(TimeGenerated, trendBinSize), ClusterName, _ResourceId
            
      QUERY
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.threshold[count.index]
    operator                = var.operator
    resource_id_column    = "_ResourceId"
    metric_measure_column = "AggregatedValue"
    dimension {
      name     = "ClusterName"
      operator = "Include"
      values   = ["*"]
    }
    failing_periods {
      minimum_failing_periods_to_trigger_alert = 4
      number_of_evaluation_periods             = 4
    }
  }
  auto_mitigation_enabled          = false
  workspace_alerts_storage_enabled = false
  description                      = var.description
  display_name                     = "Alert-AM-Hub-Subscription-AKS-Average-Node-CPU-Percentage-${var.severity_level[count.index]}"
  enabled                          = true
  skip_query_validation            = false
  action{
  action_groups = [var.action_group_id]
} 
}