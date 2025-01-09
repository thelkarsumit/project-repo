resource "google_sql_database_instance" "cloud_sql" {
   name             = var.instance_name
   database_version = var.database_version
   region           = var.region

  settings {
     tier = var.tier
     
     ip_configuration {  
        authorized_networks {
          name = var.name_authorized_networks
          value = var.value_authorized_networks
        }
        }
  }
}

resource "google_sql_database" "db" {
          name      = var.db_name
          instance  = google_sql_database_instance.cloud_sql.name
          charset   = var.charset
          collation = var.collation
}

resource "google_sql_user" "user" {
          name     = var.user_name
          instance = google_sql_database_instance.cloud_sql.name
          password = var.password
}
                                            
