module "cloud_sql" {
  source                    = "../../module/cloud_sql-mssql"
  instance_name             = var.instance_name
  database_version          = var.database_version
  region                    = var.region
  tier                      = var.tier
  name_authorized_networks  = var.name_authorized_networks
  value_authorized_networks = var.value_authorized_networks
  db_name                   = var.db_name
  charset                   = var.charset
  collation                 = var.collation
  user_name                 = var.user_name
  password                  = var.password
}