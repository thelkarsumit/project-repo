resource "azurerm_monitor_metric_alert" "load_balancer_alert" {
  for_each = var.metric_alerts
  name = "Alert-AM-Prod-Subscription-LoadBalancer-${each.key}-HealthProbeStatus"
  resource_group_name = var.rg_name
  scopes = ["/subscriptions/345e20b6-de8c-40ad-a8bf-3cf4ef613659/resourceGroups/${each.value.rg_name}/providers/Microsoft.Network/loadBalancers/${each.value.lb_name}"]
  description = var.description
  severity = each.value.severity
  enabled = true
criteria {
  metric_namespace = "Microsoft.Network/loadBalancers"
  metric_name = var.metric_name
  aggregation = var.time_aggregation_method
  operator = var.operator
  threshold = each.value.threshold
}
 action {
    action_group_id = var.action_group_id
  }
  frequency = "PT5M"
}