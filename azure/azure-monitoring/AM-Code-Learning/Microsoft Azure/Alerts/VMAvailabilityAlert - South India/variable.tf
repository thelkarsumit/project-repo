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

variable "virtual_machines_southIndia"{
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
     vm_name ="HUBSIFWCLSTR01",
      resource_group_name ="hub-si-fwgw-rg-002",
      os_type = "linux"
    },
    
    {
     vm_name ="HUBSIFWCLSTR02",
      resource_group_name ="hub-si-fwgw-rg-002",
      os_type = "linux"
    },
    
    {
     vm_name ="pdsiaksjump001",
      resource_group_name ="pd-si-aks-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="pdsielk001",
      resource_group_name ="pd-si-elk-rg-001",
      os_type = "linux"
    },

    {
     vm_name ="pdsiicollect01",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
    {
     vm_name ="pdsiicollect02",
      resource_group_name ="pd-si-icollect-rg-01",
      os_type = "linux"
    },
    {
     vm_name ="PDSIICOLLECTWIN01",
      resource_group_name ="pd-si-icollect-nrg-01",
      os_type = "windows"
    },
    {
     vm_name ="pdsiilmon001",
      resource_group_name ="pd-si-elk-rg-001",
      os_type = "linux"
    },
    {
     vm_name ="PDSISFTP001",
      resource_group_name ="pd-si-sftp-nrg-01",
      os_type = "windows"
    }
    ]
  }
}