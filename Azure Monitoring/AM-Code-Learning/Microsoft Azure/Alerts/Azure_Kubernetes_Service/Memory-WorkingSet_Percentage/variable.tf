variable "rg_name" {
  type        = string 
  description = "Name of the Resource group in which to deploy shared resources"
}
variable "action_group_id" { 
}
variable "description" {
    type = string
    default = "Container working set memory used in percent."
}
variable "metric_name" {
  type = string
  default = "node_memory_working_set_percentage"
}
variable "operator" {
  type = string
  default = "GreaterThanOrEqual"
}
variable "aggregation" {
  type = string
  default = "Average"
}

variable "metric_alert" {
  type = map(object({
    kubernetes_name = string
    rg_name = string
    severity = number
    threshold = number
  }))
    default = {
    
    devciakscluster01-Warning= {
     kubernetes_name= "devciakscluster01"
     rg_name = "DEV-CI-AKS-RG-001" 
     severity = 2
     threshold = 80
     
    },

    devciakscluster01-Error= {
     kubernetes_name= "devciakscluster01"
     rg_name = "DEV-CI-AKS-RG-001" 
     severity = 1
     threshold = 95
     
    },


    devneakscluster01-Warning= {
     kubernetes_name= "devneakscluster01"
     rg_name = "DEV-NE-AKS-RG-001" 
     severity = 2
     threshold = 80
     
    },

    devneakscluster01-Error= {
     kubernetes_name= "devneakscluster01"
     rg_name = "DEV-NE-AKS-RG-001" 
     severity = 1
     threshold = 95
     
    },

    pdciakscluster01-Warning= {
     kubernetes_name= "pdciakscluster01"
     rg_name = "PD-CI-AKS-RG-001" 
     severity = 2
     threshold = 80
     
    },

   pdciakscluster01-Error= {
     kubernetes_name= "pdciakscluster01"
     rg_name = "PD-CI-AKS-RG-001" 
     severity = 1
     threshold = 95
     
    },

    pdneakscluster01-Warning= {
     kubernetes_name= "pdneakscluster01"
     rg_name = "PD-NE-AKS-RG-001" 
     severity = 2
     threshold = 80
     
    },

    pdneakscluster01-Error= {
     kubernetes_name= "pdneakscluster01"
     rg_name = "PD-NE-AKS-RG-001" 
     severity = 1
     threshold = 95
     
    },

    pdsiakscluster01-Warning= {
     kubernetes_name= "pdsiakscluster01"
     rg_name = "pd-si-aks-rg-001" 
     severity = 2
     threshold = 80
     
    },

    pdsiakscluster01-Error= {
     kubernetes_name= "pdsiakscluster01"
     rg_name = "pd-si-aks-rg-001" 
     severity = 1
     threshold = 95
     
    },

    pdweakscluster01-Warning= {
     kubernetes_name= "pdweakscluster01"
     rg_name = "PD-WE-AKS-RG-001" 
     severity = 2
     threshold = 80
     
    },

     pdweakscluster01-Error= {
     kubernetes_name= "pdweakscluster01"
     rg_name = "PD-WE-AKS-RG-001" 
     severity = 1
     threshold = 95
     
    }
    

    
}
}

