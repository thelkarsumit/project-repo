variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "cpu_percent"
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
     PostgreSQL_name = "pdsigisinpgsql02",
     resource_group_name = "PRD-SI-GIS-RG-002"
    },

    {
     PostgreSQL_name = "pdsiicollectpgsql02",
     resource_group_name ="PD-SI-ICOLLECT-RG-01"
    }
    
    ]
  }
}
