variable "rg_name" {
  type        = string 
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  description = "Action Group Id"
}

variable "description" {
    type = string
    default = "Average Load Balancer health probe status per time duration" 
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Count"
}

variable "metric_name" {
  default = "DipAvailability"
}

variable "metric_alerts" {
  type = map(object({
    lb_name = string
    rg_name = string
    severity = number
    threshold = number
  }))
  default = {
    kubernetes-MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia-Error = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ci-aks-rg-gb-001_devciakscluster001_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_dev-ne-aks-rg-gb-001_devneakscluster001_northeurope-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ne-aks-rg-gb-001_devneakscluster001_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_dev-ne-aks-rg-gb-001_devneakscluster001_northeurope-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ne-aks-rg-gb-001_devneakscluster001_northeurope"
      severity = 2
      threshold = 1
    }
    
  }
}