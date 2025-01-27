resource "azurerm_monitor_metric_alert" "DBC-stg" {
  for_each = var.metric_alert
  name                     = "Alert-AM-Dev-Subscription-SQL-ManagedInstance-${each.key}-StorageSpaceUsed"
  resource_group_name      = var.rg_name
  scopes                   = ["/subscriptions/a86c54d3-8722-41d7-aebe-6b1106f49431/resourceGroups/${each.value.rg_name}/providers/Microsoft.sql/managedinstances/${each.value.sql_managedInstance_name}"]
  severity                 = each.value.severity
  description = "SQL Managed Instance Storage Space Used Alert"
  criteria {
    metric_namespace = "microsoft.sql/managedinstances"
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

