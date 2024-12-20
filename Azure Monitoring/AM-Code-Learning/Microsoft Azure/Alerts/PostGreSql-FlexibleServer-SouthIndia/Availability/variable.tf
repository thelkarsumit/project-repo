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

