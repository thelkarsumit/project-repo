
variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
  default = "North Europe"
}

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

variable "display_name" {
  type = string
  default = "Data Disk IOPS Consumed Percentage"
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
     vm_name ="PDCIGISIN00001",
      resource_group_name ="pd-ci-gis-rg-001",
      os_type = "windows"
    },
    
    {
     vm_name ="PDCIICLCTWIN001",
      resource_group_name ="pd-ci-icollect-rg-01",
      os_type = "windows"
    },
    {
     vm_name ="PDCISFTP00001",
      resource_group_name ="pd-ci-apacil-rg-001",
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
}


