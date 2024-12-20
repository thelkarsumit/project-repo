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

variable "postgreSQL_centralIndia" {
  type = map(any)
 default = {
    postgreSQL = [

    {
     PostgreSQL_name = "devcigispgsql02",
     resource_group_name = "dev-ci-gis-rg-001"
    },

    {
     PostgreSQL_name = "devcigispgsql03",
     resource_group_name = "DEV-CI-GIS-RG-001"
    },

    {
     PostgreSQL_name = "devciicollectpgsql02",
     resource_group_name ="dev-ci-icollect-rg-01"
    },

    {
     PostgreSQL_name = "preciicollectpgsql02",
     resource_group_name = "dev-ci-icollect-rg-01"
    },
    {
     PostgreSQL_name = "predevcigispgsql02",
     resource_group_name = "dev-ci-gis-rg-001"
    },
    {
     PostgreSQL_name = "sitciicollectpgsql02",
     resource_group_name = "dev-ci-icollect-rg-01"
    },
    {
     PostgreSQL_name = "uatciicollectpgsql02",
     resource_group_name = "dev-ci-icollect-rg-01"
    }
    ]
  }
}
