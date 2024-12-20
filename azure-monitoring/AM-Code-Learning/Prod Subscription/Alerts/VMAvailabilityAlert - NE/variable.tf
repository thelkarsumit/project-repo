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

variable "virtual_machines_northeurope"{
  type = map(any)
  default = {
    vms = [{
     vm_name ="pdneaksjump0001",
      resource_group_name ="prd-ne-aks-rg-gb-001",
      os_type = "linux"
    },
    {
     vm_name ="pdneelk00001",
      resource_group_name ="pd-ne-usil-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="PDNEIDM00001",
      resource_group_name ="pd-ne-idmcre-rg-001",
      os_type = "windows"
    },

    {
     vm_name ="pdnesftp00001",
      resource_group_name ="pd-ne-usil-rg-001",
      os_type = "windows"
    }
  
    ]
  }
}