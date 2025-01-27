resource "azurerm_monitor_metric_alert" "PostGreSQl_FailedConnectionAlert" {
   for_each = var.metric_alert
    name= "Alert-AM-Hub-Subscription-PostgreSQL-FlexibleServer-${each.key}-MaximumConnection"
    resource_group_name = var.rg_name
    scopes = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.rg_name}/providers/Microsoft.DBforPostgreSQL/flexibleServers/${each.value.postgreSQL_name}"]
 
    severity = each.value.severity
    criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = var.metric_name
    aggregation      = var.time_aggregation_method
    operator         = var.operator
    threshold        = each.value.threshold
    }
    action {
        action_group_id = var.action_group_id
    }
    window_size = "PT30M"
    frequency = "PT5M"
}

