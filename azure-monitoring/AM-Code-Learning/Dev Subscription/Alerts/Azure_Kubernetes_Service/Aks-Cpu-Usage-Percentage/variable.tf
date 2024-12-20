variable "rg_name" {
  type        = string 
  description = "Name of the Resource group in which to deploy shared resources"
}
variable "action_group_id" { 
}
variable "description" {
    type = string
    default = "Aggregated  average CPU utilization  measured in percentage across the cluster."
}
variable "metric_name" {
  type = string
  default = "node_cpu_usage_percentage"
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
    
    devciakscluster001-Warning= {
     kubernetes_name= "devciakscluster001"
     rg_name = "DEV-CI-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

    devciakscluster001-Error= {
     kubernetes_name= "devciakscluster001"
     rg_name = "DEV-CI-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }


    devneakscluster001-Warning= {
     kubernetes_name= "devneakscluster001"
     rg_name = "DEV-NE-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

   devneakscluster001-Error= {
     kubernetes_name= "devneakscluster001"
     rg_name = "DEV-NE-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }
}
}


