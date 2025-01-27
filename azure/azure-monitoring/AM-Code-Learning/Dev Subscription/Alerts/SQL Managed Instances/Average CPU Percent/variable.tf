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

    devcictsmssql02-Warning = {
      sql_managedInstance_name = "devcictsmssql02"
      rg_name = "DEV-CI-CTS-RG-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devcictsmssql02-Error = {
      sql_managedInstance_name = "devcictsmssql02"
      rg_name = "DEV-CI-CTS-RG-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    devciedpmssql002-Warning = {
      sql_managedInstance_name = "devciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devciedpmssql002-Error = {
      sql_managedInstance_name = "devciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    devcihwamssql002-Warning = {
      sql_managedInstance_name = "devcihwamssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devcihwamssql002-Error = {
      sql_managedInstance_name = "devcihwamssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    devciiclearhkmssql002-Warning = {
      sql_managedInstance_name = "devciiclearhkmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devciiclearhkmssql002-Error = {
      sql_managedInstance_name = "devciiclearhkmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    devciilmssql002-Warning = {
      sql_managedInstance_name = "devciilmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    devciilmssql002-Error = {
      sql_managedInstance_name = "devciilmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    preprodciedpmssql002-Warning = {
      sql_managedInstance_name = "preprodciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    preprodciedpmssql002-Error = {
      sql_managedInstance_name = "preprodciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    uatciedpmssql002-Warning = {
      sql_managedInstance_name = "uatciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    uatciedpmssql002-Error = {
      sql_managedInstance_name = "uatciedpmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    uatciiclearhkmssql002-Warning = {
      sql_managedInstance_name = "uatciiclearhkmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 2
      threshold = 85
      #threshold = 2
    }
    
    uatciiclearhkmssql002-Error = {
      sql_managedInstance_name = "uatciiclearhkmssql002"
      rg_name = "dev-ci-sql-paas-001"
      severity = 1
      threshold = 95
      #threshold = 1
    }

    }
  }
