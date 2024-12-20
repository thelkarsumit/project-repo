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

