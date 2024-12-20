locals {
  names = [for sql in var.PostgreSQL_SouthIndia.postgreSQL : sql["PostgreSQL_name"]]
  rg_names = [for sql in var.PostgreSQL_SouthIndia.postgreSQL : sql["resource_group_name"]]
}

data "azurerm_postgresql_flexible_server" "PostgreSQL" {
  count = length(local.names)
  name = local.names[count.index]
  resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "postgreSQL-memory_percent-ci" {
  name = "Alert-AM-Hub-Subscription-PostgreSQL-Memorypercent-Warning-SouthIndia"
  resource_group_name = var.rg_name
  scopes = toset(data.azurerm_postgresql_flexible_server.PostgreSQL[*].id)
  description = "PostgreSQL Memory Percent Alert"
  severity = var.severity
  target_resource_location = "South India"
  target_resource_type = "Microsoft.DBforPostgreSQL/flexibleServers"

  criteria {

    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name = var.metric_name
    aggregation = var.time_aggregation_method
    operator = var.operator
    threshold = var.threshold
  }

  action {
    action_group_id = var.action_group_db_id
  }

  frequency = "PT5M"

}

 