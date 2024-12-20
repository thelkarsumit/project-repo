resource "azurerm_monitor_metric_alert" "ASP_Memory_alert" {
  for_each = var.metric_alerts
  name = "Alert-AM-Hub-Subscription-DataFactory-${each.key}-PipelineFailedRuns-Critical"
  resource_group_name = var.rg_name
  scopes = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.rg_name}/providers/microsoft.datafactory/factories/${each.value.DataFactory_name}"]
  description = var.description
  severity = var.severity

  criteria {
    metric_namespace = "microsoft.datafactory/factories"
    metric_name = var.metric_name
    aggregation = var.time_aggregation_method
    operator = var.operator
    threshold = var.threshold
  }
  action {
    action_group_id = var.action_group_id
  }
  window_size = "PT15M"
  frequency = "PT15M"
}