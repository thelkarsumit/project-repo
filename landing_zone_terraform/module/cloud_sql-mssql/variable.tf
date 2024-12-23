variable "instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_version" {
  description = "Database version (e.g., POSTGRES_13, MYSQL_8_0)"
  type        = string
}

variable "region" {
  description = "Region where the Cloud SQL instance is deployed"
  type        = string
}

variable "tier" {
  description = "Machine type of the instance (e.g., db-f1-micro)"
  type        = string
}
/*
variable "authorized_networks" {
  description = "Authorized networks for the Cloud SQL instance"
  type        = list(object({
    name  = string
    value = string
    }))
        default = []
    }
*/
variable "name_authorized_networks" {
  type = string
}
variable "value_authorized_networks" {
  type = string
}
variable "db_name" {
  description = "Database name"
  type        = string
}

variable "charset" {
  description = "Character set for the database"
  type        = string
}

variable "collation" {
  description = "Collation for the database"
  type        = string
}

variable "user_name" {
  description = "Cloud SQL user name"
  type        = string
}

variable "password" {
  description = "Password for the Cloud SQL user"
  type        = string
}
                                                        