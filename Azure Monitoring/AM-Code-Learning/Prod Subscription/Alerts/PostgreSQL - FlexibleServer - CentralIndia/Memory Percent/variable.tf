variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "memory_percent"
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
