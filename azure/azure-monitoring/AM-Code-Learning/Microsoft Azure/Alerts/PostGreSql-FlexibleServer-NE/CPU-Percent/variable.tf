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

variable "PostgreSQL_NorthEurope" {
  type = map(any)
  default = {
    postgreSQL = [

    {
     PostgreSQL_name = "devneilusdbpgsql001",
     resource_group_name = "dev-ne-postgre-paas-001"
    }
    ]
  }
}
