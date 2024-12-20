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

variable "virtual_machines_southIndia" {
  type = map(any)
  default = {
    vms = [{
    #  vm_name ="PDSICTS00001",
    #   resource_group_name ="pd-si-cts-rg-001",
    #   os_type = "windows"
    # },
    
    #{
     vm_name ="PDSICTS02",
      resource_group_name ="pd-si-cts-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="PDSIGISIN00001",
      resource_group_name ="pd-si-gis-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="PDSIICLCTWIN001",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "windows"
    },
    {
     vm_name ="PDSISFTP00001",
      resource_group_name ="pd-si-apacil-rg-001",
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


