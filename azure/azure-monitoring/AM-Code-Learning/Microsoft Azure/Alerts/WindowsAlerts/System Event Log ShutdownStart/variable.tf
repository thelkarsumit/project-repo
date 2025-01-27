variable "workspace_resource_id" {
  
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  
}

variable "description" {
    type = string
    default = "Windows Event ID 41, 1074, 6006, 6008 / 6005"
}

variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
  default = "North Europe"
}

variable "time_aggregation_method" {
  type = string
  default = "Count"
}
