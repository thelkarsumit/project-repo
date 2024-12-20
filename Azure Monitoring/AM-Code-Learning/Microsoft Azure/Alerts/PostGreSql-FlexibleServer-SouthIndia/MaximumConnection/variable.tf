variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "max_connections"
}

variable "operator" {
  default = "GreaterThanOrEqual"
}

variable "time_aggregation_method" {
  default = "Maximum"
}

variable "severity" {
  type = number
  default = 2
}

variable "threshold" {
  type = number
  default = 500
}

variable "PostgreSQL_SouthIndia" {
  type = map(any)
  default = {
    postgreSQL = [

    {
     PostgreSQL_name = "pdsigisindbpgsql002",
     resource_group_name = "prd-si-gis-rg-002"
    },
    {
     PostgreSQL_name = "pdsiicollectdbpgsql01",
     resource_group_name = "pd-si-icollect-rg-01"
    }
    ]
  }
}
