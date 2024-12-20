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
    
    devciakscluster001-Warning= {
     kubernetes_name= "devciakscluster001"
     rg_name = "DEV-CI-AKS-RG-GB-001" 
     severity = 2
     threshold = 1
     
    }

    devneakscluster001-Warning= {
     kubernetes_name= "devneakscluster001"
     rg_name = "DEV-NE-AKS-RG-GB-001" 
     severity = 2
     threshold = 1
     
    }
}
}


