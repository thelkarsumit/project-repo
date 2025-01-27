variable "action_group_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "PipelineFailedRuns"
}

variable "operator" {
  default = "GreaterThan"
}

variable "description" {
   type    = string
  default = "PipelineFailedRuns"
}

variable "time_aggregation_method" {
  type = string
  default = "Count"
}

variable "threshold" {
  type = number
  default = 0
}

variable "severity" {
  type = number
  default = 0
}


variable "metric_alerts" {
  type = map(object({
    DataFactory_name = string
    rg_name = string
  }))
  default = {
    devneidmepcdf001 = {
      DataFactory_name = "devneidmepcdf001"
      rg_name = "DEV-NE-EPC-RG-001"
      
    }
  }
}


