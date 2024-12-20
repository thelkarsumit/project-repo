resource "azurerm_monitor_metric_alert" "DBC-CPU" {
  for_each = var.metric_alert
  name                     = "Alert-AM-Hub-Subscription-PostgreSQL-SingleServer-${each.key}-CPUPercent"
  resource_group_name      = var.rg_name
  scopes                   = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.rg_name}/providers/Microsoft.DBforPostgreSQL/servers/${each.value.PostgreSQL_name}"]
  severity                 = each.value.severity
  description = "PostgreSQL CPU Percent Alert"
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/servers"
    metric_name      = var.metric_name
    aggregation      = var.time_aggregation_method
    operator         = var.operator
    threshold        = each.value.threshold
  }
  action {
    action_group_id = var.action_group_db_id
  }
  frequency = "PT5M"
}

