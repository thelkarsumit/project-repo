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
     vm_name ="PDNESFTP001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    },
    {
     vm_name ="PDNEIDM001",
      resource_group_name ="PD-NE-SFTP-NRG-001",
      os_type = "windows"
    },

    {
     vm_name ="pdneelk001",
      resource_group_name ="PD-NE-ELK-RG-001",
      os_type = "linux"
    },

    {
     vm_name ="pdneaksjump001",
      resource_group_name ="pd-ne-aks-rg-001",
      os_type = "linux"
    },

    #Phase 3
    {
     vm_name ="devneelk001",
      resource_group_name ="ne-rg-corenetwork-001",
      os_type = "linux"
    },
    {
     vm_name ="HUBNEAD001",
      resource_group_name ="hub-ne-ad-nrg-001",
      os_type = "windows"
    },
    {
     vm_name ="HUBNEFWCLSTR01",
      resource_group_name ="hub-ne-fwgw-rg-002",
      os_type = "linux"
    },
    {
     vm_name ="HUBNEFWCLSTR02",
      resource_group_name ="hub-ne-fwgw-rg-002",
      os_type = "linux"
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
     vm_name ="HUBNEFWMGMT003",
      resource_group_name ="hub-ne-fwmgmt-rg-003",
      os_type = "linux"
    },
    {
     vm_name ="HUBNEFWMGMT004",
      resource_group_name ="hub-ne-fwmgmt-rg-004",
      os_type = "linux"
    },
    {
     vm_name ="HUBNEPSMANDCPM1",
      resource_group_name ="hub-ne-psm-pd-nrg-002",
      os_type = "windows"
    }

    ]
  }
}