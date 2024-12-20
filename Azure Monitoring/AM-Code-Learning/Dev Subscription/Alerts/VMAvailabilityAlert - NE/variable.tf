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
     vm_name ="devneaksjump002",
      resource_group_name ="dev-ne-aks-rg-gb-001",
      os_type = "linux"
    },
    {
     vm_name ="devnechk00001",
      resource_group_name ="dev-ne-chk-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="devneelk00001",
      resource_group_name ="dev-ne-usil-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="DEVNEIDM00001",
      resource_group_name ="dev-ne-idmcre-rg-001",
      os_type = "windows"
    },
    
    {
     vm_name ="DEVNESFTP00001",
      resource_group_name ="dev-ne-apacil-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="devnesftp11",
      resource_group_name ="dev-ne-apacil-rg-001",
      os_type = "linux"
    },
    {
     vm_name ="SITNEICHQ00001",
      resource_group_name ="dev-ne-hwa-rg-001",
      os_type = "windows"
    },
     {
     vm_name ="UATNEIDM00001",
      resource_group_name ="dev-ne-idmcre-rg-001",
      os_type = "windows"
    },
     {
      vm_name = "UATNEUSDBAUT001",
      resource_group_name ="DEV-NE-ICOLLECT-RG-01",
      os_type = "windows"
    }


    ]
  }
}