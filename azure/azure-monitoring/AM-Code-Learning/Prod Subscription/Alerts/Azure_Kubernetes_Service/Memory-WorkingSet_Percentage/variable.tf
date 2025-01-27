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
    
    pdciakscluster001-Warning= {
     kubernetes_name= "pdciakscluster001"
     rg_name = "PRD-CI-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

    pdciakscluster001-error= {
     kubernetes_name= "pdciakscluster001"
     rg_name = "PRD-CI-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }


    pdneakscluster001-Warning= {
     kubernetes_name= "pdneakscluster001"
     rg_name = "PRD-NE-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

    pdneakscluster001-error= {
     kubernetes_name= "pdneakscluster001"
     rg_name = "PRD-NE-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }

    pdsiakscluster001-Warning= {
     kubernetes_name= "pdsiakscluster001"
     rg_name = "PRD-SI-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

   pdsiakscluster001-error= {
     kubernetes_name= "pdsiakscluster001"
     rg_name = "PRD-SI-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }

    pdweakscluster001-Warning= {
     kubernetes_name= "pdweakscluster001"
     rg_name = "PRD-WE-AKS-RG-GB-001" 
     severity = 2
     threshold = 80
     
    }

    pdweakscluster001-error= {
     kubernetes_name= "pdweakscluster001"
     rg_name = "PRD-WE-AKS-RG-GB-001" 
     severity = 1
     threshold = 95
     
    }

}
}

