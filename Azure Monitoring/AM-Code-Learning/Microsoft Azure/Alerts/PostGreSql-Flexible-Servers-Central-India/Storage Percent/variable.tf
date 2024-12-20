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

