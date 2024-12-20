variable "workspace_resource_id" {
  description = "Workspace resource id to which logs will be sent"
}
variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resource alert in this example should be created."
  default = "North Europe"
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
    default = "Readiness status per node for all your cluster view count of all the nodes by readiness"
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

  default = "Average"

}

variable "severity" {
    type = number
    default = 1

}
variable "severity_level" {

    type = string
    default = "Critical"
  
}

