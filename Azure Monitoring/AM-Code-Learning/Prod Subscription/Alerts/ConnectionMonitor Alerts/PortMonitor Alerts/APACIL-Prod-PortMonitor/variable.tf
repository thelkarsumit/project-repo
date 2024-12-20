variable "workspace_resource_id" {
  description = "Workspace resource id to which logs will be sent"
}

variable "deploy_location" {
  type        = string
  default = "North Europe"
  description = "The Azure Region in which all resources in this example should be created."
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
  default = "Linux Server Port Monitoring for APACIL-Prod" 
}

variable "threshold" {
  type = number
  default = 0
}

variable "operator" {
  type = string
  default = "GreaterThan"
}

variable "time_aggregation_method" {
  type = string
  default = "Count"
}

variable "severity" {
  type = number
  default = 0
}

variable "severity_level" {
  type = string
  default = "Critical"
}