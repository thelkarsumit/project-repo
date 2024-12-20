variable "severity" {
  type = list(number)
  default = [2,1]
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  description = "Action Group Id"
}

variable "description" {
    type = string
    default = "Percentage of data disk I/Os consumed per minute"
}

variable "operator" {
    type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Average"
}

variable "virtual_machines_centralIndia" {
  type = map(any)
  default = {
    vms = [{
     vm_name ="PDCISFTP001",
      resource_group_name ="HUB-CI-MITIGATION-RG-001",
      os_type = "windows"
    },
    
    {
     vm_name ="PDCICTS001",
      resource_group_name ="HUB-CI-MITIGATION-RG-001",
      os_type = "windows"
    },

    {
     vm_name ="pdciicollectwin01",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    },

    #Phase 3
    {
     vm_name ="hubciavdedp-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-edep",
      os_type = "windows"
    },
    {
     vm_name ="hubciavdedp-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-edep",
      os_type = "windows"
    },
    {
     vm_name ="hubciavdl2-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-l2",
      os_type = "windows"
    },
    {
     vm_name ="hubciavdops-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    },
    {
     vm_name ="PDCIAVD-1",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="DEVCIDBSQL001",
      resource_group_name ="dev-ci-coll-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="DEVCIDBSQL002",
      resource_group_name ="dev-ci-coll-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="DEVCIDBSQL003",
      resource_group_name ="dev-ci-edepositsql-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="PDCIAVD-2",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="PDCIINFAVD-0",
      resource_group_name ="pd-ci-avd-rg-003",
      os_type = "windows"
    },
    {
     vm_name ="PDCIL2AVD-0",
      resource_group_name ="pd-ci-avd-rg-002",
      os_type = "windows"
    },
    {
     vm_name ="HUBCIAD001",
      resource_group_name ="hub-ci-ad-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBCIAD002",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBCIAD003",
      resource_group_name ="hub-ci-mitigation-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBCIADCON001",
      resource_group_name ="hub-ci-adcon-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="hubciavddev-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    },
    {
     vm_name ="hubciavddev-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    },
    {
     vm_name ="hubciavddev-2",
      resource_group_name ="rg-cin-prod-avd-mgmt-devl3",
      os_type = "windows"
    },
    {
     vm_name ="hubciavdinf-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    },


     {
     vm_name ="hubciavdinf-1",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    },
     {
     vm_name ="hubciavdl2-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-l2",
      os_type = "windows"
    },
     {
     vm_name ="hubciavdops-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    },
     {
     vm_name ="HUBCIPSMANDCPM1",
      resource_group_name ="hub-ci-psm-pd-nrg-001",
      os_type = "windows"
    },
     {
     vm_name ="HUBCIWSUS001",
      resource_group_name ="hub-ci-wsus-nrg-001",
      os_type = "windows"
    },
     {
     vm_name ="PDCIAVD-0",
      resource_group_name ="pd-ci-avd-rg-001",
      os_type = "windows"
    },
    #  {
    #  vm_name ="pdciicollectwin01",
    #   resource_group_name ="hub-ci-mitigation-rg-001",
    #   os_type = "windows"
    # },
     {
     vm_name ="PDCIINFAVD-1",
      resource_group_name ="pd-ci-avd-rg-003",
      os_type = "windows"
    },
     {
     vm_name ="PDCIL2AVD-1",
      resource_group_name ="pd-ci-avd-rg-002",
      os_type = "windows"
    },
     {
     vm_name ="TestWin2019v1",
      resource_group_name ="dev-ci-goldenimage-nrg-001",
      os_type = "windows"
    }
    ]
  }
}

variable "metric_name" {
  default = "Data Disk IOPS Consumed Percentage"
}

variable "severity_level" {
    type = list(string)
    default = ["Warning","Error"]
  
}
variable "threshold" {
  type = list(number)
  default = [85,90] 
  # default = [ 1,2 ]
}


