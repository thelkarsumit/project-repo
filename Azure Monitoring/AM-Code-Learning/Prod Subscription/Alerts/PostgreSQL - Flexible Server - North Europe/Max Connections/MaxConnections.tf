locals {
  names = [for sql in var.postgreSQL.postgreSQL : sql["PostgreSQL_name"]]
  rg_names = [for sql in var.postgreSQL.postgreSQL : sql["resource_group_name"]]
}

data "azurerm_postgresql_flexible_server" "postgreSQL" {
  count = length(local.names)
  name = local.names[count.index]
  resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "postgreSQL-max_connections-NE" {
  name = "Alert-AM-Prod-Subscription-PostgreSQL-MaximumConnections-Warning-NorthEurope"
  resource_group_name = var.rg_name
  scopes = toset(data.azurerm_postgresql_flexible_server.postgreSQL[*].id)
  description = "PostgreSQL Max Connections Alert"
  severity = var.severity
  target_resource_location = "North Europe"
  target_resource_type = "Microsoft.DBforPostgreSQL/flexibleServers"
  window_size = "PT30M"

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

 