variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}
variable "action_group_id" {
  
}
variable "description" {
    type = string
    default = "The count of requests resulting in an HTTP status code = 500 but < 600. " 
}
variable "display_name" {
    type = string
  default = "Http Server Errors"
}
variable "operator" {
    type = string
  default = "GreaterThan"
}
variable "aggregation" {
  type = string
  default = "Average"
}
variable "severity" {
  type = list(number)
  default = [2,1]
}
variable "metric_name"{
    type = string
    default = "Http5xx"
}

variable "metric_alerts" {
  default = {
    arcsight-monitor-functionapp-Warning = {
      functionApp_name = "arcsight-monitor-functionapp"
      functionApp_rg_name = "arcsightfunctionsgroup"
      severity = 2
      threshold = 50
    },
    arcsight-monitor-functionapp-Error = {
      functionApp_name = "arcsight-monitor-functionapp"
      functionApp_rg_name = "arcsightfunctionsgroup"
      severity = 1
      threshold = 100
    },
    arcsightcloudfunctionapp-Warning = {
      functionApp_name = "arcsightcloudfunctionapp"
      functionApp_rg_name = "arcsightfunctionsgroup"
      severity = 2
      threshold = 50
    },
    arcsightcloudfunctionapp-Error = {
      functionApp_name = "arcsightcloudfunctionapp"
      functionApp_rg_name = "arcsightfunctionsgroup"
      severity = 1
      threshold = 100
    },

    iclear-g2b-function-dryrun-Warning = {
      functionApp_name = "iclear-g2b-function-dryrun"
      functionApp_rg_name = "iclear-G2B-function-RG"
      severity = 2
      threshold = 50
    },
    iclear-g2b-function-dryrun-Error = {
      functionApp_name = "iclear-g2b-function-dryrun"
      functionApp_rg_name = "iclear-G2B-function-RG"
      severity = 1
      threshold = 100
    },

    prd-ci-iclear-function-001-Warning = {
      functionApp_name = "prd-ci-iclear-function-001"
      functionApp_rg_name = "PD-CI-iClear-RG-001"
      severity = 2
      threshold = 50
    },
    prd-ci-iclear-function-001-Error = {
      functionApp_name = "prd-ci-iclear-function-001"
      functionApp_rg_name = "PD-CI-iClear-RG-001"
      severity = 1
      threshold = 100
    },

    prd-si-iclear-function-001-Warning = {
      functionApp_name = "prd-si-iclear-function-001"
      functionApp_rg_name = "PD-SI-iCLEAR-RG-001"
      severity = 2
      threshold = 50
    },
    prd-si-iclear-function-001-Error = {
      functionApp_name = "prd-si-iclear-function-001"
      functionApp_rg_name = "PD-SI-iCLEAR-RG-001"
      severity = 1
      threshold = 100
    },

    testfunction1241-Warning = {
      functionApp_name = "testfunction1241"
      functionApp_rg_name = "testfunction1241"
      severity = 2
      threshold = 50
    },
    testfunction1241-Error = {
      functionApp_name = "testfunction1241"
      functionApp_rg_name = "testfunction1241"
      severity = 1
      threshold = 100
    },

    uat-ci-iclear-function-001-Warning = {
      functionApp_name = "uat-ci-iclear-function-001"
      functionApp_rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 2
      threshold = 50
    },
    uat-ci-iclear-function-001-Error = {
      functionApp_name = "uat-ci-iclear-function-001"
      functionApp_rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 1
      threshold = 100
    }
   
  }
}
    

  
