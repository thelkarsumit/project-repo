variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {

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

variable "metric_alert" {
 
  type = map(object({
 
    PostgreSQL_name = string
    rg_name = string
 
  }))
 
  default = {
 
    pdciicollectdbpgsql01= {
      PostgreSQL_name = "pdciicollectdbpgsql01"
      rg_name = "PD-CI-ICOLLECT-RG-01"
    }

    # pdneidmcredbpgsql001= {
    #   PostgreSQL_name = "pdneidmcredbpgsql001"
    #   rg_name = "PD-NE-POSTGRE-PAAS-001"
    # }
  }
}
