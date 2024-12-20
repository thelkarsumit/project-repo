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
     vm_name ="pdweaksjump0001",
      resource_group_name ="prd-we-aks-rg-gb-001",
      os_type = "linux"
    },
    {
     vm_name ="pdweelk00001",
      resource_group_name ="pd-we-usil-rg-001",
      os_type = "linux"
    },
    
    {
     vm_name ="PDWEIDM00001",
      resource_group_name ="pd-we-idmcre-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="pdwesftp00001",
      resource_group_name ="pd-we-usil-rg-001",
      os_type = "windows"
    }
  
  
    ]
  }
}