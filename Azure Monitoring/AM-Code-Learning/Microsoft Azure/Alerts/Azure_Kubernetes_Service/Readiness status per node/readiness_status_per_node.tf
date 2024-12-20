resource "azurerm_monitor_scheduled_query_rules_alert_v2" "readiness_status_per_node" {
  count = length(var.threshold)
  name                = "Alert-AM-Hub-Subscription-AKS-Readiness-Status-Per-Node-${var.severity_level}"
  resource_group_name = var.rg_name
  location            = var.deploy_location
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity
  criteria {
    query                   = <<-QUERY
        let endDateTime = now();
        let startDateTime = ago(1h);
        let trendBinSize = 1m;
        KubeNodeInventory
        | where TimeGenerated < endDateTime
        | where TimeGenerated >= startDateTime
        | distinct ClusterName, Computer, _ResourceId,TimeGenerated
        | summarize ClusterSnapshotCount = count() by bin(TimeGenerated, trendBinSize), ClusterName, Computer, _ResourceId
        | join hint.strategy=broadcast kind=inner (
            KubeNodeInventory 
            | where TimeGenerated < endDateTime
            | where TimeGenerated >= startDateTime
            | summarize TotalCount = count(), ReadyCount = sumif(1, Status contains ('Ready'))
                        by ClusterName, Computer,  bin(TimeGenerated, trendBinSize), _ResourceId //calculating NotReadyCount
            | extend NotReadyCount = TotalCount - ReadyCount
        ) on ClusterName, Computer, _ResourceId, TimeGenerated
        | project   TimeGenerated, ClusterName, Computer, ReadyCount = todouble(ReadyCount) / ClusterSnapshotCount, 
                    NotReadyCount = todouble(NotReadyCount) / ClusterSnapshotCount, _ResourceId
        
      QUERY
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.threshold
    operator                = var.operator
    resource_id_column    = "_ResourceId"
    metric_measure_column = "NotReadyCount"
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
  display_name                     = "Alert-AM-Hub-Subscription-AKS-Readiness-Status-Per-Node-${var.severity_level}"
  enabled                          = true
  skip_query_validation            = false
  action{
  action_groups = [var.action_group_id]
} 
}