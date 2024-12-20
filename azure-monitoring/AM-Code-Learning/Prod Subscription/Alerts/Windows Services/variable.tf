variable "workspace_resource_id" {
  description = "Workspace resource id to which logs will be sent"
}


variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "action_group_id" {
  
}

variable "description" {
  type = string
  default = "Windows Service Alert"
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