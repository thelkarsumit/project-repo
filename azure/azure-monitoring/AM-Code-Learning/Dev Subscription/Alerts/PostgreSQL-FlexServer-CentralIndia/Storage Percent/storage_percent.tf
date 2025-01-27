locals {
  names = [for sql in var.postgreSQL_centralIndia.postgreSQL : sql["PostgreSQL_name"]]
  rg_names = [for sql in var.postgreSQL_centralIndia.postgreSQL : sql["resource_group_name"]]
}

data "azurerm_postgresql_flexible_server" "postgreSQL" {
  count = length(local.names)
  name = local.names[count.index]
  resource_group_name = local.rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "postgreSQL-storage_percent-ci" {
  name = "Alert-AM-Dev-Subscription-PostgreSQL-Storagepercent-Warning-CentralIndia"
  resource_group_name = var.rg_name
  scopes = toset(data.azurerm_postgresql_flexible_server.postgreSQL[*].id)
  description = "PostgreSQL Flexible Server Storage Percent Alert"
  severity = var.severity
  target_resource_location = "Central India"
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

 