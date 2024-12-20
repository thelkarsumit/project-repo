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
     vm_name ="DEVCICTS00001",
      resource_group_name ="dev-ci-cts-rg-001",
      os_type = "windows"
    },
    
    {
     vm_name ="DEVCICTS02",
      resource_group_name ="dev-ci-cts-rg-001",
      os_type = "windows"
    },

    {
     vm_name ="devcigis00001",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    
    {
     vm_name ="DEVCIICLCTWIN01",
      resource_group_name ="dev-ci-icollect-rg-01",
      os_type = "windows"
    },
    {
     vm_name ="DEVCISFTP00001",
      resource_group_name ="dev-ci-apacil-rg-001",
      os_type = "windows"
    },
     {
     vm_name ="Precigis00001",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
     {
     vm_name ="PRFTSTCIAPSCN1",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="PRFTSTCIAPSCN2",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="SITCIICHQ00001",
      resource_group_name ="dev-ci-hwa-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="UATCIGISAUTO004",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="UATCIGISAUTO005",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="UATCIGISAUTO006",
      resource_group_name ="dev-ci-gis-rg-001",
      os_type = "windows"
    }, 
    {
      vm_name = "UATCIICOLAUT001",
      resource_group_name ="DEV-CI-ICOLLECT-RG-01",
      os_type = "windows"
    },
    {
      vm_name = "UATCIICLRAUT001",
      resource_group_name ="DEV-CI-ICOLLECT-RG-01",
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


