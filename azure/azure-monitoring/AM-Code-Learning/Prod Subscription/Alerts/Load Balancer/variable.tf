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
    kubernetes-MC_PRD-CI-AKS-RG-GB-001_pdciakscluster001_centralindia-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-CI-AKS-RG-GB-001_pdciakscluster001_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PRD-CI-AKS-RG-GB-001_pdciakscluster001_centralindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-CI-AKS-RG-GB-001_pdciakscluster001_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PRD-NE-AKS-RG-GB-001_pdneakscluster001_northeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-NE-AKS-RG-GB-001_pdneakscluster001_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PRD-NE-AKS-RG-GB-001_pdneakscluster001_northeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-NE-AKS-RG-GB-001_pdneakscluster001_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PRD-SI-AKS-RG-GB-001_pdsiakscluster001_southindia-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-SI-AKS-RG-GB-001_pdsiakscluster001_southindia"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PRD-SI-AKS-RG-GB-001_pdsiakscluster001_southindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-SI-AKS-RG-GB-001_pdsiakscluster001_southindia"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PRD-WE-AKS-RG-GB-001_pdweakscluster001_westeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-WE-AKS-RG-GB-001_pdweakscluster001_westeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PRD-WE-AKS-RG-GB-001_pdweakscluster001_westeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PRD-WE-AKS-RG-GB-001_pdweakscluster001_westeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-mc_prd-ci-aks-rg-gb-001_pdciakscluster001_centralindia-internal-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-ci-aks-rg-gb-001_pdciakscluster001_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_prd-ci-aks-rg-gb-001_pdciakscluster001_centralindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-ci-aks-rg-gb-001_pdciakscluster001_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_prd-ne-aks-rg-gb-001_pdneakscluster001_northeurope-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-ne-aks-rg-gb-001_pdneakscluster001_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_prd-ne-aks-rg-gb-001_pdneakscluster001_northeurope-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-ne-aks-rg-gb-001_pdneakscluster001_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_prd-si-aks-rg-gb-001_pdsiakscluster001_southindia-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-si-aks-rg-gb-001_pdsiakscluster001_southindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_prd-si-aks-rg-gb-001_pdsiakscluster001_southindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-si-aks-rg-gb-001_pdsiakscluster001_southindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-we-aks-rg-gb-001_pdweakscluster001_westeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_prd-we-aks-rg-gb-001_pdweakscluster001_westeurope"
      severity = 2
      threshold = 1
    },

    PD-CI-HWA-LB-002-Error = {
      lb_name = "PD-CI-HWA-LB-002"
      rg_name = "PD-CI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-HWA-LB-002-Warning = {
      lb_name = "PD-CI-HWA-LB-002"
      rg_name = "PD-CI-HWA-RG-001"
      severity = 2
      threshold = 1
    }

  }
}