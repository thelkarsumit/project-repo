locals {
  names = [for sql in var.PostgreSQL_NorthEurope.postgreSQL : sql["PostgreSQL_name"]]
  rg_names = [for sql in var.PostgreSQL_NorthEurope.postgreSQL : sql["resource_group_name"]]
}

data "azurerm_postgresql_flexible_server" "PostgreSQL" {
  count = length(local.names)
  name = local.names[count.index]
  resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "postgreSQL-Availability" {
  name = "Alert-AM-Hub-Subscription-PostgreSQL-DatabaseIsAlive-Critical-NorthEurope"
  resource_group_name = var.rg_name
  scopes = toset(data.azurerm_postgresql_flexible_server.PostgreSQL[*].id)
  description = "Database is Alive Alert: Confirms availability"
  severity = var.severity
  target_resource_location = "North Europe"
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

 