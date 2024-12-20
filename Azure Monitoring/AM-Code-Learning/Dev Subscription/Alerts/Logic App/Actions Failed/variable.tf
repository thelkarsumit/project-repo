variable "rg_name" {
  type = string

  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  description = "Action Group Id"
}

variable "description" {
  type    = string
  default = "Number of workflow actions failed."
}

variable "operator" {
  type    = string
  default = "GreaterThan"
}
variable "time_aggregation_method" {
  type    = string
  default = "Count"
}

variable "metric_name" {
  default = "ActionsFailed"
}

variable "severity" {
  default = 0
}
variable "threshold" {
  default = 0
}


variable "metric_alert" {
  type = map(object({
    LogicApp_name = string
    rg_name = string
  }))
  default = {
    LA-DEV-CI-APACIL-KV-02 = {
      LogicApp_name = "LA-DEV-CI-APACIL-KV-02"
      rg_name = "DEV-CI-KV-EXP-NOT-001"
      
    },

    LA-DEV-CI-CTS-DB-KV-02 = {
      LogicApp_name = "LA-DEV-CI-CTS-DB-KV-02"
      rg_name = "DEV-CI-KV-EXP-NOT-001"
      
    },

    LA-DEV-CI-CTS-KV-02 = {
      LogicApp_name = "LA-DEV-CI-CTS-KV-02"
      rg_name = "DEV-CI-KV-EXP-NOT-001"
      
    },

    LA-DEV-CI-EDEPOSIT-KV-02 = {
      LogicApp_name = "LA-DEV-CI-EDEPOSIT-KV-02"
      rg_name = "DEV-CI-KV-EXP-NOT-001"
      
    },

    LA-DEV-CI-EDP-DB-KV-02 = {
      LogicApp_name = "LA-DEV-CI-EDP-DB-KV-02"
      rg_name = "DEV-CI-KV-EXP-NOT-001"
      
    }

  }
}


