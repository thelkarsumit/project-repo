variable "rg_name" {
  type        = string 
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
}

variable "description" {
    type = string
    default = "Client processing time"
}

variable "metric_name" {
    type = string
  default = "dependencies/duration"
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "aggregation" {
  type = string
  default = "Average"
}

variable "metric_alert" {
  type = map(object({
    insight_name = string
    rg_name = string
    severity = number
    threshold = number
 
  }))
  default = {
    dev-ci-gis-001-Warning= {
     insight_name = "dev-ci-gis-001"
      rg_name = "DEV-CI-GIS-RG-001"
      severity = 2
      threshold = 3000
    }

    dev-ci-gis-001-Error= {
       insight_name = "dev-ci-gis-001"
      rg_name = "DEV-CI-GIS-RG-001"
      severity = 1
      threshold = 5000
    }

    iclear-g2b-function-Warning= {
     insight_name = "iclear-g2b-function"
      rg_name = "iclear-G2B-function-RG"
      severity = 2
      threshold = 3000
    }

    iclear-g2b-function-Error= {
      insight_name = "iclear-g2b-function"
      rg_name = "iclear-G2B-function-RG"
      severity = 1
      threshold = 5000
    }

    iclear-g2b-function-dryrun-Warning= {
     insight_name = "iclear-g2b-function-dryrun"
      rg_name = "iclear-G2B-function-RG"
      severity = 2
      threshold = 3000
    }

    iclear-g2b-function-dryrun-Error= {
      insight_name = "iclear-g2b-function-dryrun"
      rg_name = "iclear-G2B-function-RG"
      severity = 1
      threshold = 5000
    }

    icollect-apac-preprod-Warning= {
     insight_name = "icollect-apac-preprod"
      rg_name = "DEV-CI-ICOLLECT-RG-001"
      severity = 2
      threshold = 3000
    }

    icollect-apac-preprod-Error= {
      insight_name = "icollect-apac-preprod"
      rg_name = "DEV-CI-ICOLLECT-RG-001"
      severity = 1
      threshold = 5000
    }

    Postgres-Job-Schedule-Warning= {
     insight_name = "Postgres-Job-Schedule"
      rg_name = "DEV-CI-POSTGRE-PAAS-001"
      severity = 2
      threshold = 3000
    }

    Postgres-Job-Schedule-Error= {
      insight_name = "Postgres-Job-Schedule"
      rg_name = "DEV-CI-POSTGRE-PAAS-001"
      severity = 1
      threshold = 5000
    }

    prd-ci-iclear-function-001-Warning= {
     insight_name = "prd-ci-iclear-function-001"
      rg_name = "PD-CI-iClear-RG-001"
      severity = 2
      threshold = 3000
    }

    prd-ci-iclear-function-001-Error= {
      insight_name = "prd-ci-iclear-function-001"
      rg_name = "PD-CI-iClear-RG-001"
      severity = 1
      threshold = 5000
    }

    pre-ci-gis-001-Warning= {
     insight_name = "pre-ci-gis-001"
      rg_name = "PRE-CI-AKS-001"
      severity = 2
      threshold = 3000
    }

    pre-ci-gis-001-Error = {
      insight_name = "pre-ci-gis-001"
      rg_name = "PRE-CI-AKS-001"
      severity = 1
      threshold = 5000
    }

    prod-ci-iclear-g2b-function-Warning= {
     insight_name = "prod-ci-iclear-g2b-function"
      rg_name = "iclear-G2B-function-RG"
      severity = 2
      threshold = 3000
    }

    prod-ci-iclear-g2b-function-Error= {
      insight_name = "prod-ci-iclear-g2b-function"
      rg_name = "iclear-G2B-function-RG"
      severity = 1
      threshold = 5000
    }

    testfunction1241-Warning= {
     insight_name = "testfunction1241"
      rg_name = "testfunction1241"
      severity = 2
      threshold = 3000
    }

    testfunction1241-Error= {
      insight_name = "testfunction1241"
      rg_name = "testfunction1241"
      severity = 1
      threshold = 5000
    }

    uat-ci-iclear-function-001-Warning= {
     insight_name = "uat-ci-iclear-function-001"
      rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 2
      threshold = 3000
    }

    uat-ci-iclear-function-001-Error= {
      insight_name = "uat-ci-iclear-function-001"
      rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 1
      threshold = 5000
    }

    usdisb-eu-preprod-Warning= {
     insight_name = "usdisb-eu-preprod"
      rg_name = "DEV-NE-AKS-RG-001"
      severity = 2
      threshold = 3000
    }

    usdisb-eu-preprod-Error= {
       insight_name = "usdisb-eu-preprod"
      rg_name = "DEV-NE-AKS-RG-001"
      severity = 1
      threshold = 5000
    }
  }
}
