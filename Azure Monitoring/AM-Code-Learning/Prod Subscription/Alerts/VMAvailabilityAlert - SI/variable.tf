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

variable "virtual_machines_southIndia"{
  type = map(any)
  default = {
    vms = [{
     vm_name ="pdsiaksjump0001",
      resource_group_name ="prd-si-aks-rg-gb-001",
      os_type = "linux"
    },
    {
     vm_name ="pdsiapphwa00001",
      resource_group_name ="pd-si-hwa-rg-001",
      os_type = "linux"
    },
    
    # {
    #  vm_name ="PDSICTS00001",
    #   resource_group_name ="pd-si-cts-rg-001",
    #   os_type = "windows"
    # },

    {
     vm_name ="PDSICTS02",
      resource_group_name ="pd-si-cts-rg-001",
      os_type = "windows"
    },

    {
     vm_name ="pdsidbhwa00001",
      resource_group_name ="pd-si-hwa-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdsielk00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdsiexactoapp01",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdsiexactodpt01",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="pdsiexactohk001",
      resource_group_name ="pd-si-iclear-rg-001",
      os_type = "linux"
    },
     {
     vm_name ="PDSIGISIN00001",
      resource_group_name ="pd-si-gis-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="pdsiiclct001",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
     {
     vm_name ="pdsiiclct002",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
     {
     vm_name ="PDSIICLCTWIN001",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "windows"
    },
     {
     vm_name ="pdsiilmon00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "linux"
    },
     {
     vm_name ="PDSISFTP00001",
      resource_group_name ="pd-si-apacil-rg-001",
      os_type = "windows"
   }
  
    ]
  }
}