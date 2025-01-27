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
    
    backend-lb-HUB-CI-FWGW-RG-001-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-CI-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-CI-FWGW-RG-001-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-CI-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    backend-lb-HUB-CI-FWGW-RG-002-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-CI-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-CI-FWGW-RG-002-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-CI-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    # backend-lb-HUB-NE-FWGW-RG-001-Error = {
    #   lb_name = "backend-lb"
    #   rg_name = "HUB-NE-FWGW-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    backend-lb-HUB-NE-FWGW-RG-001-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-NE-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    # backend-lb-HUB-NE-FWGW-RG-002-Error = {
    #   lb_name = "backend-lb"
    #   rg_name = "HUB-NE-FWGW-RG-002"
    #   severity = 1
    #   threshold = 2
    # },
    backend-lb-HUB-NE-FWGW-RG-002-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-NE-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    backend-lb-HUB-SI-FWGW-RG-001-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-SI-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-SI-FWGW-RG-001-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-SI-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    backend-lb-HUB-SI-FWGW-RG-002-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-SI-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-SI-FWGW-RG-002-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-SI-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    backend-lb-HUB-WE-FWGW-RG-001-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-WE-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-WE-FWGW-RG-001-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-WE-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    backend-lb-HUB-WE-FWGW-RG-002-Error = {
      lb_name = "backend-lb"
      rg_name = "HUB-WE-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    backend-lb-HUB-WE-FWGW-RG-002-Warning = {
      lb_name = "backend-lb"
      rg_name = "HUB-WE-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    # CITESTSQLCLTRLBIN-Error = {
    #   lb_name = "CITESTSQLCLTRLBIN"
    #   rg_name = "SQLON-CLUSTER-TEST-RG"
    #   severity = 1
    #   threshold = 2
    # },
    # CITESTSQLCLTRLBIN-Warning = {
    #   lb_name = "CITESTSQLCLTRLBIN"
    #   rg_name = "SQLON-CLUSTER-TEST-RG"
    #   severity = 2
    #   threshold = 1
    # },

    d379ec2a-b5ca-4350-8b85-a4a1338e9fa0-azurebatch-cloudserviceloadbalancer-Error = {
      lb_name = "d379ec2a-b5ca-4350-8b85-a4a1338e9fa0-azurebatch-cloudserviceloadbalancer"
      rg_name = "NE-RG-CoreNetwork-001"
      severity = 1
      threshold = 2
    },
    d379ec2a-b5ca-4350-8b85-a4a1338e9fa0-azurebatch-cloudserviceloadbalancer-Warning = {
      lb_name = "d379ec2a-b5ca-4350-8b85-a4a1338e9fa0-azurebatch-cloudserviceloadbalancer"
      rg_name = "NE-RG-CoreNetwork-001"
      severity = 2
      threshold = 1
    },

    DEV-CI-AKS-LB-001-Error = {
      lb_name = "DEV-CI-AKS-LB-001"
      rg_name = "DEV-CI-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    # DEV-CI-AKS-LB-001-Warning = {
    #   lb_name = "DEV-CI-AKS-LB-001"
    #   rg_name = "DEV-CI-AKS-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    DEV-CI-JASPER-LB-001-Error = {
      lb_name = "DEV-CI-JASPER-LB-001"
      rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 1
      threshold = 2
    },
    DEV-CI-JASPER-LB-001-Warning = {
      lb_name = "DEV-CI-JASPER-LB-001"
      rg_name = "DEV-CI-iCLEAR-RG-001"
      severity = 2
      threshold = 1
    },

    # DEV-CI-WILDFLY-LB-001-Error = {
    #   lb_name = "DEV-CI-WILDFLY-LB-001"
    #   rg_name = "DEV-CI-iCLEAR-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # DEV-CI-WILDFLY-LB-001-Warning = {
    #   lb_name = "DEV-CI-WILDFLY-LB-001"
    #   rg_name = "DEV-CI-iCLEAR-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    DEV-NE-AKS-LB-001-Error = {
      lb_name = "DEV-NE-AKS-LB-001"
      rg_name = "DEV-NE-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    DEV-NE-AKS-LB-001-Warning = {
      lb_name = "DEV-NE-AKS-LB-001"
      rg_name = "DEV-NE-AKS-RG-001"
      severity = 2
      threshold = 1
    },

    DEV-NE-AKS-LB-002-Error = {
      lb_name = "DEV-NE-AKS-LB-002"
      rg_name = "DEV-NE-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    # DEV-NE-AKS-LB-002-Warning = {
    #   lb_name = "DEV-NE-AKS-LB-002"
    #   rg_name = "DEV-NE-AKS-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    frontend-HUB-CI-FWGW-RG-001-lb-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-CI-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    # frontend-HUB-CI-FWGW-RG-001-lb-Warning = {
    #   lb_name = "frontend-lb"
    #   rg_name = "HUB-CI-FWGW-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    frontend-HUB-CI-FWGW-RG-002-lb-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-CI-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    frontend-HUB-CI-FWGW-RG-002-lb-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-CI-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    # frontend-lb-HUB-NE-FWGW-RG-001-Error = {
    #   lb_name = "frontend-lb"
    #   rg_name = "HUB-NE-FWGW-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    frontend-lb-HUB-NE-FWGW-RG-001-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-NE-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    # frontend-lb-HUB-NE-FWGW-RG-002-Error = {
    #   lb_name = "frontend-lb"
    #   rg_name = "HUB-NE-FWGW-RG-002"
    #   severity = 1
    #   threshold = 2
    # },
    frontend-lb-HUB-NE-FWGW-RG-002-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-NE-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    frontend-lb-HUB-SI-FWGW-RG-001-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-SI-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    frontend-lb-HUB-SI-FWGW-RG-001-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-SI-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    frontend-lb-HUB-SI-FWGW-RG-002-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-SI-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    frontend-lb-HUB-SI-FWGW-RG-002-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-SI-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    frontend-lb-HUB-WE-FWGW-RG-001-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-WE-FWGW-RG-001"
      severity = 1
      threshold = 2
    },
    frontend-lb-HUB-WE-FWGW-RG-001-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-WE-FWGW-RG-001"
      severity = 2
      threshold = 1
    },

    frontend-lb-HUB-WE-FWGW-RG-002-Error = {
      lb_name = "frontend-lb"
      rg_name = "HUB-WE-FWGW-RG-002"
      severity = 1
      threshold = 2
    },
    frontend-lb-HUB-WE-FWGW-RG-002-Warning = {
      lb_name = "frontend-lb"
      rg_name = "HUB-WE-FWGW-RG-002"
      severity = 2
      threshold = 1
    },

    frontend-lb-Hub-ci-mitigation-rg-001-Error = {
      lb_name = "frontend-lb"
      rg_name = "Hub-ci-mitigation-rg-001"
      severity = 1
      threshold = 2
    },
    frontend-lb-Hub-ci-mitigation-rg-001-Warning = {
      lb_name = "frontend-lb"
      rg_name = "Hub-ci-mitigation-rg-001"
      severity = 2
      threshold = 1
    },

    # HUB-CI-CTX-INT-LB-001-Error = {
    #   lb_name = "HUB-CI-CTX-INT-LB-001"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # HUB-CI-CTX-INT-LB-001-Warning = {
    #   lb_name = "HUB-CI-CTX-INT-LB-001"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    # HUB-CI-CTX-INT-LB-002-Error = {
    #   lb_name = "HUB-CI-CTX-INT-LB-002"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # HUB-CI-CTX-INT-LB-002-Warning = {
    #   lb_name = "HUB-CI-CTX-INT-LB-002"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    # HUB-CI-CTX-INT-LB-003-Error = {
    #   lb_name = "HUB-CI-CTX-INT-LB-003"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # HUB-CI-CTX-INT-LB-003-Warning = {
    #   lb_name = "HUB-CI-CTX-INT-LB-003"
    #   rg_name = "HUB-CI-CITRIX-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    internalsit-lb-Error = {
      lb_name = "internalsit-lb"
      rg_name = "DEV-NE-DOCKER-RG-001"
      severity = 1
      threshold = 2
    },
    internalsit-lb-Warning = {
      lb_name = "internalsit-lb"
      rg_name = "DEV-NE-DOCKER-RG-001"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PD-NE-AKS-RG-001_pdneakscluster01_northeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-NE-AKS-RG-001_pdneakscluster01_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PD-NE-AKS-RG-001_pdneakscluster01_northeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-NE-AKS-RG-001_pdneakscluster01_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PD-SI-AKS-RG-001_pdsiakscluster01_southindia-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-SI-AKS-RG-001_pdsiakscluster01_southindia"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PD-SI-AKS-RG-001_pdsiakscluster01_southindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-SI-AKS-RG-001_pdsiakscluster01_southindia"
      severity = 2
      threshold = 1
    },

    kubernetes-MC_PD-WE-AKS-RG-001_pdweakscluster01_westeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-WE-AKS-RG-001_pdweakscluster01_westeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-MC_PD-WE-AKS-RG-001_pdweakscluster01_westeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PD-WE-AKS-RG-001_pdweakscluster01_westeurope"
      severity = 2
      threshold = 1
    },

    # kubernetes-MC_PRE-CI-AKS-001_precigisakscluster001_centralindia-Error = {
    #   lb_name = "kubernetes"
    #   rg_name = "MC_PRE-CI-AKS-001_precigisakscluster001_centralindia"
    #   severity = 1
    #   threshold = 2
    # },
    kubernetes-MC_PRE-CI-AKS-001_precigisakscluster001_centralindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "MC_PRE-CI-AKS-001_precigisakscluster001_centralindia"
      severity = 2
      threshold = 1
    },

    # kubernetes-dev-ne-docker-rg-001-Error = {
    #   lb_name = "kubernetes"
    #   rg_name = "dev-ne-docker-rg-001"
    #   severity = 1
    #   threshold = 2
    # },
    # kubernetes-dev-ne-docker-rg-001-Warning = {
    #   lb_name = "kubernetes"
    #   rg_name = "dev-ne-docker-rg-001"
    #   severity = 2
    #   threshold = 1
    # },

    kubernetes-mc_dev-ci-aks-rg-001_devciakscluster01_centralindia-Error = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ci-aks-rg-001_devciakscluster01_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-mc_dev-ci-aks-rg-001_devciakscluster01_centralindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ci-aks-rg-001_devciakscluster01_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-mc_dev-ne-aks-rg-001_devneakscluster01_northeurope-Error = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ne-aks-rg-001_devneakscluster01_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-mc_dev-ne-aks-rg-001_devneakscluster01_northeurope-Warning = {
      lb_name = "kubernetes"
      rg_name = "mc_dev-ne-aks-rg-001_devneakscluster01_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia-Error = {
      lb_name = "kubernetes"
      rg_name = "mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia-Warning = {
      lb_name = "kubernetes"
      rg_name = "mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia"
      severity = 2
      threshold = 1
    },

    # kubernetes-internal-DEV-CI-DOCKER-RG-001-Error = {
    #   lb_name = "kubernetes-internal"
    #   rg_name = "DEV-CI-DOCKER-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # kubernetes-internal-DEV-CI-DOCKER-RG-001-Warning = {
    #   lb_name = "kubernetes-internal"
    #   rg_name = "DEV-CI-DOCKER-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    kubernetes-internal-mc_dev-ci-aks-rg-001_devciakscluster01_centralindia-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ci-aks-rg-001_devciakscluster01_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_dev-ci-aks-rg-001_devciakscluster01_centralindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ci-aks-rg-001_devciakscluster01_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_dev-ne-aks-rg-001_devneakscluster01_northeurope-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_dev-ne-aks-rg-001_devneakscluster01_northeurope"
      severity = 1
      threshold = 2
    },
    # kubernetes-internal-mc_dev-ne-aks-rg-001_devneakscluster01_northeurope-Warning = {
    #   lb_name = "kubernetes-internal"
    #   rg_name = "mc_dev-ne-aks-rg-001_devneakscluster01_northeurope"
    #   severity = 2
    #   threshold = 1
    # },

    kubernetes-internal-mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-ci-aks-rg-001_pdciakscluster01_centralindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_pd-ne-aks-rg-001_pdneakscluster01_northeurope-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-ne-aks-rg-001_pdneakscluster01_northeurope"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_pd-ne-aks-rg-001_pdneakscluster01_northeurope-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-ne-aks-rg-001_pdneakscluster01_northeurope"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_pd-si-aks-rg-001_pdsiakscluster01_southindia-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-si-aks-rg-001_pdsiakscluster01_southindia"
      severity = 1
      threshold = 2
    },
    kubernetes-internal-mc_pd-si-aks-rg-001_pdsiakscluster01_southindia-Warning = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-si-aks-rg-001_pdsiakscluster01_southindia"
      severity = 2
      threshold = 1
    },

    kubernetes-internal-mc_pd-we-aks-rg-001_pdweakscluster01_westeurope-Error = {
      lb_name = "kubernetes-internal"
      rg_name = "mc_pd-we-aks-rg-001_pdweakscluster01_westeurope"
      severity = 1
      threshold = 2
    },
    # kubernetes-internal-mc_pd-we-aks-rg-001_pdweakscluster01_westeurope-Warning = {
    #   lb_name = "kubernetes-internal"
    #   rg_name = "mc_pd-we-aks-rg-001_pdweakscluster01_westeurope"
    #   severity = 2
    #   threshold = 1
    # },

    PD-CI-AKS-LB-001-Error = {
      lb_name = "PD-CI-AKS-LB-001"
      rg_name = "PD-CI-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-AKS-LB-001-Warning = {
      lb_name = "PD-CI-AKS-LB-001"
      rg_name = "PD-CI-AKS-RG-001"
      severity = 2
      threshold = 1
    },

    PD-CI-HWA-APP-LB-001-Error = {
      lb_name = "PD-CI-HWA-APP-LB-001"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-HWA-APP-LB-001-Warning = {
      lb_name = "PD-CI-HWA-APP-LB-001"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 2
      threshold = 1
    },

    PD-CI-HWA-APP-LB-002-Error = {
      lb_name = "PD-CI-HWA-APP-LB-002"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-HWA-APP-LB-002-Warning = {
      lb_name = "PD-CI-HWA-APP-LB-002"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 2
      threshold = 1
    },

    PD-CI-HWA-DB-LB-001-Error = {
      lb_name = "PD-CI-HWA-DB-LB-001"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-HWA-DB-LB-001-Warning = {
      lb_name = "PD-CI-HWA-DB-LB-001"
      rg_name = "PRD-CI-HWA-RG-001"
      severity = 2
      threshold = 1
    },

    PD-CI-LAM-LB-001-Error = {
      lb_name = "PD-CI-LAM-LB-001"
      rg_name = "PD-CI-LAM-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-LAM-LB-001-Warning = {
      lb_name = "PD-CI-LAM-LB-001"
      rg_name = "PD-CI-LAM-RG-001"
      severity = 2
      threshold = 1
    },

    PD-CI-SQL-INT-LB-001-Error = {
      lb_name = "PD-CI-SQL-INT-LB-001"
      rg_name = "PD-CI-SQLCLTR-RG-001"
      severity = 1
      threshold = 2
    },
    PD-CI-SQL-INT-LB-001-Warning = {
      lb_name = "PD-CI-SQL-INT-LB-001"
      rg_name = "PD-CI-SQLCLTR-RG-001"
      severity = 2
      threshold = 1
    },

    PD-NE-AKS-LB-001-Error = {
      lb_name = "PD-NE-AKS-LB-001"
      rg_name = "PD-NE-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    PD-NE-AKS-LB-001-Warning = {
      lb_name = "PD-NE-AKS-LB-001"
      rg_name = "PD-NE-AKS-RG-001"
      severity = 2
      threshold = 1
    },

    PD-SI-AKS-LB-001-Error = {
      lb_name = "PD-SI-AKS-LB-001"
      rg_name = "PD-SI-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    PD-SI-AKS-LB-001-Warning = {
      lb_name = "PD-SI-AKS-LB-001"
      rg_name = "PD-SI-AKS-RG-001"
      severity = 2
      threshold = 1
    },

    PD-SI-HWA-APP-LB-001-Error = {
      lb_name = "PD-SI-HWA-APP-LB-001"
      rg_name = "PRD-SI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-SI-HWA-APP-LB-001-Warning = {
      lb_name = "PD-SI-HWA-APP-LB-001"
      rg_name = "PRD-SI-HWA-RG-001"
      severity = 2
      threshold = 1
    },

    PD-SI-HWA-DB-LB-001-Error = {
      lb_name = "PD-SI-HWA-DB-LB-001"
      rg_name = "PRD-SI-HWA-RG-001"
      severity = 1
      threshold = 2
    },
    PD-SI-HWA-DB-LB-001-Warning = {
      lb_name = "PD-SI-HWA-DB-LB-001"
      rg_name = "PRD-SI-HWA-RG-001"
      severity = 2
      threshold = 1
    },

    PD-SI-SQL-INT-LB-001-Error = {
      lb_name = "PD-SI-SQL-INT-LB-001"
      rg_name = "PD-SI-SQLCLTR-RG-001"
      severity = 1
      threshold = 2
    },
    PD-SI-SQL-INT-LB-001-Warning = {
      lb_name = "PD-SI-SQL-INT-LB-001"
      rg_name = "PD-SI-SQLCLTR-RG-001"
      severity = 2
      threshold = 1
    },

    PD-WE-AKS-LB-001-Error = {
      lb_name = "PD-WE-AKS-LB-001"
      rg_name = "PD-WE-AKS-RG-001"
      severity = 1
      threshold = 2
    },
    PD-WE-AKS-LB-001-Warning = {
      lb_name = "PD-WE-AKS-LB-001"
      rg_name = "PD-WE-AKS-RG-001"
      severity = 2
      threshold = 1
    },

    PRE-CI-AKS-001-Error = {
      lb_name = "PRE-CI-AKS-001"
      rg_name = "PRE-CI-AKS-001"
      severity = 1
      threshold = 2
    },
    PRE-CI-AKS-001-Warning = {
      lb_name = "PRE-CI-AKS-001"
      rg_name = "PRE-CI-AKS-001"
      severity = 2
      threshold = 1
    },

    # SFTP-NE-EXT-LB-001-Error = {
    #   lb_name = "SFTP-NE-EXT-LB-001"
    #   rg_name = "PD-NE-SFTP-RG-001"
    #   severity = 1
    #   threshold = 2
    # },
    # SFTP-NE-EXT-LB-001-Warning = {
    #   lb_name = "SFTP-NE-EXT-LB-001"
    #   rg_name = "PD-NE-SFTP-RG-001"
    #   severity = 2
    #   threshold = 1
    # },

    # SITESTSQLCLTRLBIN-Error = {
    #   lb_name = "SITESTSQLCLTRLBIN"
    #   rg_name = "SQLON-CLUSTER-TEST-RG"
    #   severity = 1
    #   threshold = 2
    # },
    # SITESTSQLCLTRLBIN-Warning = {
    #   lb_name = "SITESTSQLCLTRLBIN"
    #   rg_name = "SQLON-CLUSTER-TEST-RG"
    #   severity = 2
    #   threshold = 1
    # },

  }
}