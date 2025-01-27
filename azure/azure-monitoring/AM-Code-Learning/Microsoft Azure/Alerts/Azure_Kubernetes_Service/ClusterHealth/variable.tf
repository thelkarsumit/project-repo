variable "rg_name" {
  type        = string 
  description = "Name of the Resource group in which to deploy shared resources"
}
variable "action_group_id" { 
}
variable "description" {
    type = string
    default = "Determine whether or not cluster autoscaler will take action on cluster."
}
variable "metric_name" {
  type = string
  default = "cluster_autoscaler_cluster_safe_to_autoscale"
}
variable "operator" {
  type = string
  default = "LessThan"
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
     threshold = 1
     
    },

    devneakscluster01-Warning= {
     kubernetes_name= "devneakscluster01"
     rg_name = "DEV-NE-AKS-RG-001" 
     severity = 2
     threshold = 1
     
    },

    pdciakscluster01-Warning= {
     kubernetes_name= "pdciakscluster01"
     rg_name = "PD-CI-AKS-RG-001" 
     severity = 2
     threshold = 1
     
    },


    pdneakscluster01-Warning= {
     kubernetes_name= "pdneakscluster01"
     rg_name = "PD-NE-AKS-RG-001" 
     severity = 2
     threshold = 1
     
    },

    pdsiakscluster01-Warning= {
     kubernetes_name= "pdsiakscluster01"
     rg_name = "pd-si-aks-rg-001" 
     severity = 2
     threshold = 1
     
    },

   

    pdweakscluster01-Warning= {
     kubernetes_name= "pdweakscluster01"
     rg_name = "PD-WE-AKS-RG-001" 
     severity = 2
     threshold = 1
     
    }
    
}
}


