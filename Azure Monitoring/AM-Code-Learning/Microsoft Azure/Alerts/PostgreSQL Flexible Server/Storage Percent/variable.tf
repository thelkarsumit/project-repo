variable "action_group_id" {
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

variable "metric_alert" {
 
  type = map(object({
 
    PostgreSQL_name = string
    rg_name = string
    severity = number
    threshold = number
 
  }))
 
  default = {
 
   pdciicollectdbpgsql01-Warning = {
      PostgreSQL_name = "pdciicollectdbpgsql01"
      rg_name = "PD-CI-ICOLLECT-RG-01"
      severity = 2
      threshold = 85
      #threshold = 40
    }
 
    # pdciicollectdbpgsql01-Error = {
    #   PostgreSQL_name = "pdciicollectdbpgsql01"
    #   rg_name = "PD-CI-ICOLLECT-RG-01"
    #   severity = 1
    #   threshold = 90
    #   #threshold = 50
    # }

    # pdneidmcredbpgsql001-Warning= {
    #   PostgreSQL_name = "pdneidmcredbpgsql001"
    #   rg_name = "PD-NE-POSTGRE-PAAS-001"
    #   severity = 2
    #   threshold = 40
    # }

    # pdneidmcredbpgsql001-Error= {
    #   PostgreSQL_name = "pdneidmcredbpgsql001"
    #   rg_name = "PD-NE-POSTGRE-PAAS-001"
    #   severity = 1
    #   threshold = 50
    # }
    }
  }  
