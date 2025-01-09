instance_name       = "my-mssql-instance"
database_version    = "SQLSERVER_2019_STANDARD" # Supported MSSQL versions: SQLSERVER_2017_STANDARD, SQLSERVER_2019_STANDARD, etc.
region              = "us-central1"
tier                = "db-g1-small" # Adjust the tier according to your workload and requirements

/*
  authorized_networks = [
    {
        name  = "default-network"
        value = "0.0.0.0/0" # Replace with specific CIDR for better security
    }
    ]
*/
name_authorized_networks = "default-network"
value_authorized_networks = "0.0.0.0/0"
db_name   = "mydatabase"
charset   = "SQL_Latin1_General_CP1_CI_AS" # MSSQL default charset
collation = "SQL_Latin1_General_CP1_CI_AS" # Default collation for MSSQL
user_name = "sqladmin"
password  = "Secure@Password123" # Ensure this meets MSSQL password complexity requirements
                        