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
     PostgreSQL_name = "pdweidmcredbpgsql002",
     resource_group_name = "PD-WE-IDMCRE-RG-001"
    },

    {
     PostgreSQL_name = "pdweusdbpgsql002",
     resource_group_name ="PD-WE-USDB-RG-001"
    },

    {
     PostgreSQL_name = "pdweusilpgsql002",
     resource_group_name = "PD-WE-USIL-RG-001"
    }
    ]
  }
}
