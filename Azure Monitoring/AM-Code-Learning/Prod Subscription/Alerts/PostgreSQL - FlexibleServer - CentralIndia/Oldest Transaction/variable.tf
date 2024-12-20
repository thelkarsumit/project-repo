variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_db_id" {

}

variable "threshold" {
  type = number
  default = 18000
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Maximum"
}

variable "severity" {
  type = number
  default = 1
}

variable "metric_name"{
    type = string
    default = "longest_transaction_time_sec"
}

variable "postgreSQL" {
  type = map(any)
  default = {
    postgreSQL = [{
     PostgreSQL_name = "pdcigisinpgsql02",
     resource_group_name = "PD-CI-GIS-RG-001"
    },
    
    {
     PostgreSQL_name = "pdciicollectpgsql02",
     resource_group_name ="PD-CI-ICOLLECT-RG-01"
    },

    {
     PostgreSQL_name = "pdicollectcidbpgsql01",
     resource_group_name = "PD-CI-MSSQL-RG-01"
    },

    ]
  }
}
