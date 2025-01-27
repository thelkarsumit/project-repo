variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "storage_percent"
}

variable "operator" {
  default = "GreaterThanOrEqual"
}

variable "time_aggregation_method" {
  default = "Average"
}

variable "severity" {
  type = number
  default = 2
}

variable "threshold" {
  type = number
  default = 85
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
