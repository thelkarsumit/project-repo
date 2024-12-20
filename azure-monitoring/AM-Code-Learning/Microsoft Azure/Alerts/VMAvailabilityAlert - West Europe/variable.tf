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

variable "virtual_machines_westeurope"{
  type = map(any)
  default = {
    vms = [{
     vm_name ="HUBWEAD001",
      resource_group_name ="hub-we-ad-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBWEFWCLSTR01",
      resource_group_name ="hub-we-fwgw-rg-002",
      os_type = "linux"
    },
    
    {
     vm_name ="HUBWEFWCLSTR02",
      resource_group_name ="hub-we-fwgw-rg-002",
      os_type = "linux"
    },

    {
     vm_name ="HUBWEFWMGMT003",
      resource_group_name ="hub-we-fwmgmt-rg-003",
      os_type = "linux"
    },

    {
     vm_name ="hubwelogr001",
      resource_group_name ="hub-we-logr-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdweaksjump001",
      resource_group_name ="pd-we-aks-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="pdweelk001",
      resource_group_name ="pd-we-elk-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="PDWEIDM001",
      resource_group_name ="pd-we-sftp-nrg-001",
      os_type = "windows"
    },

    {
     vm_name ="PDWESFTP001",
      resource_group_name ="pd-we-sftp-nrg-001",
      os_type = "windows"
    }
    ]
  }
}