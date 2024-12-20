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

variable "severity" {
  type = number
  default = 2
}

variable "threshold" {
  type = number
  default = 1
}

variable "metric_alert" {
  type = map(object({
    kubernetes_name = string
    rg_name = string
    
  }))
    default = {
    
    pdciakscluster001= {
     kubernetes_name= "pdciakscluster001"
     rg_name = "PRD-CI-AKS-RG-GB-001" 
     
    }

    pdneakscluster001= {
     kubernetes_name= "pdneakscluster001"
     rg_name = "PRD-NE-AKS-RG-GB-001" 
     
    }


    pdsiakscluster001= {
     kubernetes_name= "pdsiakscluster001"
     rg_name = "PRD-SI-AKS-RG-GB-001" 
     
    }


    pdweakscluster001= {
     kubernetes_name= "pdweakscluster001"
     rg_name = "PRD-WE-AKS-RG-GB-001" 
     
    }


}
}


