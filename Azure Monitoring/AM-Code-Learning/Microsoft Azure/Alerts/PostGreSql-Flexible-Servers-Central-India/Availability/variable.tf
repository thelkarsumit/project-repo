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

variable "PostgreSQL_CentralIndia" {
  type = map(any)
  default = {
    postgreSQL = [

    {
     PostgreSQL_name = "pdcigisindbpgsql002",
     resource_group_name = "prd-ci-gis-rg-001"
    },

    {
     PostgreSQL_name = "pdciicollectdbpgsql01",
     resource_group_name ="pd-ci-icollect-rg-01"
    },

    {
     PostgreSQL_name = "precigisdbpgsql001ps",
     resource_group_name = "dev-ci-postgre-paas-001"
    },
    {
     PostgreSQL_name = "preprodciicollectdbpgsql001",
     resource_group_name = "dev-ci-postgre-paas-001"
    },
    {
     PostgreSQL_name = "uatciicollectdbpgsql002",
     resource_group_name = "dev-ci-postgre-paas-001"
    }
    ]
  }
}

