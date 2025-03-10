variable "workspace_resource_id" {  
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
}

variable "description" {
  type = string
  default = "Logical Disk UsedSpace"
}

variable "threshold" {
  type = list(number)
  # default = [0.0001,0.0002]
  default = [ 85,90 ]
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
  type = list(number)
  default = [2,1]
}

variable "severity_level" {
    type = list(string)
    default = ["Warning","Error"]
}
