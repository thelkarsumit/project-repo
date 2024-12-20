variable "action_group_id" {
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

variable "metric_alert" {
  type = map(object({
    postgreSQL_name = string
    rg_name = string
    severity = number
    threshold = number
  }))

  default = {

    pdciicollectdbpgsql01-Warning = {
      postgreSQL_name = "pdciicollectdbpgsql01"
      rg_name = "PD-CI-ICOLLECT-RG-01"
      severity = 2
      threshold = 500
    }
    
    # pdneidmcredbpgsql001-Warning= {
    #   postgreSQL_name = "pdneidmcredbpgsql001"
    #   rg_name = "PD-NE-POSTGRE-PAAS-001"
    #   severity = 2
    #   threshold = 500
    # }
    
    }
  }