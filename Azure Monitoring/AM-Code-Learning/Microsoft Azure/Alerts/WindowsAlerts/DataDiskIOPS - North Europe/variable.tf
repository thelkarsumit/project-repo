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
     vm_name ="PDNESFTP001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    },
    {
     vm_name ="PDNEIDM001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    },

    #Phase 3
    {
     vm_name ="HUBNEAD001",
      resource_group_name ="hub-ne-ad-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBNEFWMG002",
      resource_group_name ="hub-ne-fwmgmt-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBNEFWMG003",
      resource_group_name ="hub-ne-fwmgmt-nrg-003",
      os_type = "windows"
    },
    # {
    #  vm_name ="HUBNEFWMG003-poc",
    #   resource_group_name ="hub-ne-fwmgmt-nrg-003",
    #   os_type = "windows"
    # },
    {
     vm_name ="HUBNEPSMANDCPM1",
      resource_group_name ="hub-ne-psm-pd-nrg-002",
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
   #default = [ 1,2 ]
}


