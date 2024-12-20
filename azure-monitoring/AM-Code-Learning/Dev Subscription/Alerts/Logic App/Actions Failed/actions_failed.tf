resource "azurerm_monitor_metric_alert" "DBC-logic" {
  for_each = var.metric_alert
  name                     = "Alert-AM-Dev-Subscription-LogicApp-${each.key}-ActionsFailed-Critical"
  resource_group_name      = var.rg_name
  scopes                   = ["/subscriptions/a86c54d3-8722-41d7-aebe-6b1106f49431/resourceGroups/${each.value.rg_name}/providers/Microsoft.Logic/workflows/${each.value.LogicApp_name}"]
  severity                 = var.severity
  description = "Logic App Alert"
  criteria {
    metric_namespace = "Microsoft.Logic/workflows"
    metric_name      = var.metric_name
    aggregation      = var.time_aggregation_method
    operator         = var.operator
    threshold        = var.threshold
  }
  action {
    action_group_id = var.action_group_id
  }
  frequency = "PT5M"
}

