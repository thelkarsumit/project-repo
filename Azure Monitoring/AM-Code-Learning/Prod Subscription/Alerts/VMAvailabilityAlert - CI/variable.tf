variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {

}

variable "description" {
    type = string
    default = "The percentage of availability for the virtual machines"

}

variable "threshold" {
  type = number
  default = 1
}

variable "operator" {
    type = string
  default = "LessThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Average"
}

variable "severity" {
  type = number
  default = 0
}

variable "metric_name"{
    type = string
    default = "VmAvailabilityMetric"
}

variable "virtual_machines_centralIndia"{
  type = map(any)
  default = {
    vms = [{
     vm_name ="pdciaksjump0001",
      resource_group_name ="prd-ci-aks-rg-gb-001",
      os_type = "linux"
    },
    {
     vm_name ="pdciapphwa00001",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdciapphwa00002",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="PDCICTS00001",
      resource_group_name ="pd-ci-cts-rg-001",
      os_type = "windows"
    },

    {
     vm_name ="PDCICTS02",
      resource_group_name ="pd-ci-cts-rg-001",
      os_type = "windows"
    },
    
    {
     vm_name ="pdcidbhwa00001",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdcidbhwa00002",
      resource_group_name ="pd-ci-hwa-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdcielk00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="pdciexactoapp01",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
     {
     vm_name ="pdciexactodpt01",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
    {
     vm_name ="pdciexactohk001",
      resource_group_name ="pd-ci-iclear-rg-001",
      os_type = "linux"
    },
     {
     vm_name ="PDCIGISIN00001",
      resource_group_name ="pd-ci-gis-rg-001",
      os_type = "windows"
    },
     {
     vm_name ="pdciiclct001",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    },
     {
     vm_name ="pdciiclct002",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "linux"
    },
     {
     vm_name ="PDCIICLCTWIN001",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "windows"
    }, 
     {
     vm_name ="pdciilmon00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },
     {
     vm_name ="pdcinagios00002",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "linux"
    },
    #  {
    #  vm_name ="pdcinagios00003",
    #   resource_group_name ="pd-ci-apacil-rg-001",
    #   os_type = "linux"
    # },
    #  {
    #  vm_name ="pdcinagios00004",
    #   resource_group_name ="pd-ci-apacil-rg-001",
    #   os_type = "linux"
    # },
     {
     vm_name ="PDCISFTP00001",
      resource_group_name ="pd-ci-apacil-rg-001",
      os_type = "windows"
    },
    # {
    #   vm_name = "pdcinagios0001",
    #   resource_group_name ="PD-CI-APACIL-RG-001",
    #   os_type = "linux"
    # }
  
    ]
  }
}