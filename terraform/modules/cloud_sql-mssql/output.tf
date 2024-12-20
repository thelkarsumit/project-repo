output "instance_name" {
 description = "Instance connection name"
 value = google_sql_database_instance.cloud_sql.name
}

output "instance_connection_name" {
      description = "Instance connection name"
        value       = google_sql_database_instance.cloud_sql.connection_name
}

output "db_name" {
          description = "Database name"
            value       = google_sql_database.db.name
}
