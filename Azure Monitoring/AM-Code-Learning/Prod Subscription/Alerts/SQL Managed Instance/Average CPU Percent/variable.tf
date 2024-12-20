variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "avg_cpu_percent"
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

    pdcictsmssql002-Warning = {
      sql_managedInstance_name = "pdcictsmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcictsmssql002-Error = {
      sql_managedInstance_name = "pdcictsmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdciedpmssql002-Warning = {
      sql_managedInstance_name = "pdciedpmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdciedpmssql002-Error = {
      sql_managedInstance_name = "pdciedpmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdcihwamssql002-Warning = {
      sql_managedInstance_name = "pdcihwamssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdcihwamssql002-Error = {
      sql_managedInstance_name = "pdcihwamssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdciiclearhkmssql002-Warning = {
      sql_managedInstance_name = "pdciiclearhkmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdciiclearhkmssql002-Error = {
      sql_managedInstance_name = "pdciiclearhkmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdciiclearsgmssql002-Warning = {
      sql_managedInstance_name = "pdciiclearsgmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdciiclearsgmssql002-Error = {
      sql_managedInstance_name = "pdciiclearsgmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdciilmssql002-Warning = {
      sql_managedInstance_name = "pdciilmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdciilmssql002-Error = {
      sql_managedInstance_name = "pdciilmssql002"
      rg_name = "PD-CI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsictsmssql002-Warning = {
      sql_managedInstance_name = "pdsictsmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsictsmssql002-Error = {
      sql_managedInstance_name = "pdsictsmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsiedpmssql002-Warning = {
      sql_managedInstance_name = "pdsiedpmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsiedpmssql002-Error = {
      sql_managedInstance_name = "pdsiedpmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsihwamssql002-Warning = {
      sql_managedInstance_name = "pdsihwamssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsihwamssql002-Error = {
      sql_managedInstance_name = "pdsihwamssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsiiclearhkmssql002-Warning = {
      sql_managedInstance_name = "pdsiiclearhkmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsiiclearhkmssql002-Error = {
      sql_managedInstance_name = "pdsiiclearhkmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }
    
    pdsiiclearsgmssql002-Warning = {
      sql_managedInstance_name = "pdsiiclearsgmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsiiclearsgmssql002-Error = {
      sql_managedInstance_name = "pdsiiclearsgmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    pdsiilmssql002-Warning = {
      sql_managedInstance_name = "pdsiilmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    pdsiilmssql002-Error = {
      sql_managedInstance_name = "pdsiilmssql002"
      rg_name = "PD-SI-MSSQL-RG-01"
      severity = 1
      threshold = 95
      #threshold = 1
    }
    
    }
  }
