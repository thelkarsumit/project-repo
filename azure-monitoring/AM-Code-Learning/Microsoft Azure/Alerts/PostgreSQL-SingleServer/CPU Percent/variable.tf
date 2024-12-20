variable "action_group_db_id" {
  description = "Action Group Id"
}

variable "rg_name" {
  
}

variable "metric_name" {
  default = "cpu_percent"
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
 
    PostgreSQL_name = string
    rg_name = string
    severity = number
    threshold = number
 
  }))
 
  default = {
 
    devciaquapgsql001-Warning = {
      PostgreSQL_name = "devciaquapgsql001"
      rg_name = "DEV-CI-AQUA-PAAS-001"
      severity = 2
      threshold = 85
      threshold = 2
    }

    devcidbpgsql001ps-Warning= {
      PostgreSQL_name = "devcidbpgsql001ps"
      rg_name = "DEV-CI-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }

    devnedbpgsql001ps-Warning= {
      PostgreSQL_name = "devnedbpgsql001ps"
      rg_name = "DEV-NE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }

    devnedbpgsql002us-Warning= {
      PostgreSQL_name = "devnedbpgsql002us"
      rg_name = "DEV-NE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }
     

    pdcigisindbpgsql001-Warning= {
      PostgreSQL_name = "pdcigisindbpgsql001"
      rg_name = "PRD-CI-GIS-RG-001"
      severity = 2
      threshold = 85
    }

    pdneidmcredbpgsql001-Warning= {
      PostgreSQL_name = "pdneidmcredbpgsql001"
      rg_name = "PD-NE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }

    pdneilusdbpgsql001-Warning= {
      PostgreSQL_name = "pdneilusdbpgsql001"
      rg_name = "PD-NE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }

    pdneusdbpgsql001-Warning= {
      PostgreSQL_name = "pdneusdbpgsql001"
      rg_name = "PD-NE-USDB-RG-001"
      severity = 2
      threshold = 85
    }


   pdsigisindbpgsql001-Warning= {
      PostgreSQL_name = "pdsigisindbpgsql001"
      rg_name = "PRD-CI-GIS-RG-001"
      severity = 2
      threshold = 85
    }
 
      pdweidmcredbpgsql001-Warning= {
      PostgreSQL_name = "pdweidmcredbpgsql001"
      rg_name = "PD-WE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }
    
     pdweilusdbpgsql001-Warning= {
      PostgreSQL_name = "pdweilusdbpgsql001"
      rg_name = "PD-WE-POSTGRE-PAAS-001"
      severity = 2
      threshold = 85
    }

    pdweusdbpgsql001-Warning= {
      PostgreSQL_name = "pdweusdbpgsql001"
      rg_name = "PD-NE-USDB-RG-001"
      severity = 2
      threshold = 85
    }

    }
  }
