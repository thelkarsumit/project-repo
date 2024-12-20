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
     vm_name ="hubsiavdinf-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-infra",
      os_type = "windows"
    },
    
    {
     vm_name ="hubsiavdops-0",
      resource_group_name ="rg-cin-prod-avd-mgmt-ops",
      os_type = "windows"
    },

    {
     vm_name ="PDSIAVD-0",
      resource_group_name ="pd-si-avd-rg-001",
      os_type = "windows"
    },

    {
     vm_name ="PDSIAVD-1",
      resource_group_name ="pd-si-avd-rg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBSIAD001",
      resource_group_name ="hub-si-ad-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="PDSIICOLLECTWIN01",
      resource_group_name ="pd-si-icollect-nrg-01",
      os_type = "windows"
    },
    {
     vm_name ="PDSISFTP001",
      resource_group_name ="pd-si-sftp-nrg-01",
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


