variable "workspace_resource_id" {
}

variable "dcr_name" {
  type = string
  description = "Name of the DCR"
  default = "DCR-AM-Prod-Subscription"
}

variable "deploy_location" {
  type        = string
  default     = "North Europe"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}

variable "virtual_machines" {
  
}

