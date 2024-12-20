resource "azurerm_monitor_metric_alert" "function_app_http5xx" {
  for_each = var.metric_alerts
  name = "Alert-AM-Hub-Subscription-FunctionApp-Http5xx-${each.key}"
  resource_group_name = var.rg_name
  scopes = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.functionApp_rg_name}/providers/Microsoft.Web/sites/${each.value.functionApp_name}"]
  description = var.description
  severity = each.value.severity
  criteria {
    metric_namespace = "microsoft.web/sites"
    metric_name = var.metric_name
    aggregation = var.aggregation
    operator = var.operator
    threshold = each.value.threshold
  }
  action {
    action_group_id = var.action_group_id
  }
   window_size = "PT15M"
  frequency = "PT15M"
}