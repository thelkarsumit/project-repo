variable "law_name" {
  type = string
  default = "LAW-AM-Hub-Subscription" 
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource group in which to deploy shared resources"
}