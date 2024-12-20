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

variable "virtual_machines_northeurope" {
  type = map(any)
  default = {
    vms = [{
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


