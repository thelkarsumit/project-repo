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
    default = "Container Memory Megabytes Percentage used"
  
}
variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
  default = "North Europe"
}


variable "threshold" {
  type = list(number)
  default = [80,95]

}
variable "operator" {
    type = string
  default = "GreaterThanOrEqual"
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