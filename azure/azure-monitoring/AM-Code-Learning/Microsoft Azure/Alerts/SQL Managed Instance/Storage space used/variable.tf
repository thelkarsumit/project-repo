variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "storage_space_used_mb"
}

variable "operator" {
  default = "GreaterThanOrEqual"
}

variable "time_aggregation_method" {
  type = string
  default = "Average"
}

variable "metric_alert" {
 
  type = map(object({
 
    sql_managedInstance_name = string
    rg_name = string
    severity = number
    threshold = number
 
  }))
 
  default = {
   devcimssqlcts001-Warning = {
      sql_managedInstance_name = "devcimssqlcts001"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devcimssqlcts001-Error = {
      sql_managedInstance_name = "devcimssqlcts001"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    devcimssqliclearuat001-Warning = {
      sql_managedInstance_name = "devcimssqliclearuat001"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devcimssqliclearuat001-Error = {
      sql_managedInstance_name = "devcimssqliclearuat001"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdcimssqlcts001-Warning = {
      sql_managedInstance_name = "pdcimssqlcts001"
      rg_name = "pd-ci-sqlcltr-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcimssqlcts001-Error = {
      sql_managedInstance_name = "pdcimssqlcts001"
      rg_name = "pd-ci-sqlcltr-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    # pdcimssqledeposit001-Warning = {
    #   sql_managedInstance_name = "pdcimssqledeposit001"
    #   rg_name = "pd-ci-sqlmi-edeposit-nrg-001"
    #   severity = 2
    #   threshold = 85
    #   #threshold = 2
    # }
    
    # pdcimssqledeposit001-Error = {
    #   sql_managedInstance_name = "pdcimssqledeposit001"
    #   rg_name = "pd-ci-sqlmi-edeposit-nrg-001"
    #   severity = 1
    #   threshold = 95
    #   #threshold = 1
    # }

    pdcimssqliclear001-Warning = {
      sql_managedInstance_name = "pdcimssqliclear001"
      rg_name = "pd-ci-sqlcltr-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcimssqliclear001-Error = {
      sql_managedInstance_name = "pdcimssqliclear001"
      rg_name = "pd-ci-sqlcltr-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdcimssqliclearhk002-Warning = {
      sql_managedInstance_name = "pdcimssqliclearhk002"
      rg_name = "PD-CI-SQLCLTR-RG-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcimssqliclearhk002-Error = {
      sql_managedInstance_name = "pdcimssqliclearhk002"
      rg_name = "PD-CI-SQLCLTR-RG-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdcimssqlil001-Warning = {
      sql_managedInstance_name = "pdcimssqlil001"
      rg_name = "pd-ci-il-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcimssqlil001-Error = {
      sql_managedInstance_name = "pdcimssqlil001"
      rg_name = "pd-ci-il-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsimssqlcts001-Warning = {
      sql_managedInstance_name = "pdsimssqlcts001"
      rg_name = "pd-si-sqlcltr-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsimssqlcts001-Error = {
      sql_managedInstance_name = "pdsimssqlcts001"
      rg_name = "pd-si-sqlcltr-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    # pdsimssqledeposit001-Warning = {
    #   sql_managedInstance_name = "pdsimssqledeposit001"
    #   rg_name = "pd-si-sqlmi-edeposit-nrg-001"
    #   severity = 2
    #   threshold = 85
    #   #threshold = 2
    # }
    
    # pdsimssqledeposit001-Error = {
    #   sql_managedInstance_name = "pdsimssqledeposit001"
    #   rg_name = "pd-si-sqlmi-edeposit-nrg-001"
    #   severity = 1
    #   threshold = 95
    #   #threshold = 1
    # }

    pdsimssqliclear001-Warning = {
      sql_managedInstance_name = "pdsimssqliclear001"
      rg_name = "pd-si-sqlcltr-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsimssqliclear001-Error = {
      sql_managedInstance_name = "pdsimssqliclear001"
      rg_name = "pd-si-sqlcltr-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }
    
     pdsimssqliclearhk002-Warning = {
      sql_managedInstance_name = "pdsimssqliclearhk002"
      rg_name = "PD-SI-SQLCLTR-RG-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsimssqliclearhk002-Error = {
      sql_managedInstance_name = "pdsimssqliclearhk002"
      rg_name = "PD-SI-SQLCLTR-RG-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

     pdsimssqlil001-Warning = {
      sql_managedInstance_name = "pdsimssqlil001"
      rg_name = "prd-si-il-rg-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsimssqlil001-Error = {
      sql_managedInstance_name = "pdsimssqlil001"
      rg_name = "prd-si-il-rg-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }
    
    }
  }
