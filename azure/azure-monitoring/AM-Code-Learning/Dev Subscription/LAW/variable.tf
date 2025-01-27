variable "law_name" {
  type = string
  description = "Name of the LAW"
  default = "LAW-AM-Dev-Subscription"
}

variable "deploy_location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
  default     = "North Europe"
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"

}
