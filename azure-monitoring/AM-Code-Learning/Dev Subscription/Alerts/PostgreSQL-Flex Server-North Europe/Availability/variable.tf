variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_db_id" {

}

variable "threshold" {
  type = number
  default = 1
}

variable "operator" {
    type = string
  default = "LessThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Average"
}

variable "severity" {
  type = number
  default = 0
}

variable "metric_name"{
    type = string
    default = "is_db_alive"
}

variable "postgreSQL" {
  type = map(any)
  default = {
    postgreSQL = [

    {
     PostgreSQL_name = "devnedataflowdbpgsql002",
     resource_group_name = "dev-ne-chk-rg-001"
    },

    {
     PostgreSQL_name = "devnedbpgsql00002us",
     resource_group_name ="dev-ne-usdb-rg-001"
    },

    {
     PostgreSQL_name = "devnedbpgsql002ps",
     resource_group_name = "dev-ne-usdb-rg-001"
    },
    {
     PostgreSQL_name = "devneidmcredbpgsql002",
     resource_group_name = "dev-ne-idmcre-rg-001"
    },
    {
     PostgreSQL_name = "devnemchkdbpgsql002",
     resource_group_name = "dev-ne-chk-rg-001"
    },
    {
     PostgreSQL_name = "devneusilpgsql002",
     resource_group_name = "dev-ne-usil-rg-001"
    },
    {
     PostgreSQL_name = "uatneidmcredbpgsql002",
     resource_group_name = "dev-ne-idmcre-rg-001"
    }
    ]
  }
}