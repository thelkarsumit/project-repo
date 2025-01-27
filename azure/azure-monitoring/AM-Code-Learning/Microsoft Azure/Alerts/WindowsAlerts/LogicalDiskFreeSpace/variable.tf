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
    default = "Logical Disk Free Space"
}

variable "threshold" {
  type = list(number)
  default = [15,10]
   #default = [95,90] 
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
  type = list(number)
  default = [2,1]
}

variable "severity_level" {
    type = list(string)
    default = ["Warning","Error"]
}
