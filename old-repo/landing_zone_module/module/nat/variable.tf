variable "region" {
  description = "The GCP region"
  type        = string
}

variable "network" {
  description = "The network name"
  type        = string
}

variable "subnetwork_name" {
  description = "The subnetwork name for the NAT gateway"
  type        = string
}

variable "router_name" {
  description = "The name of the compute router"
  type        = string
}

variable "nat_name" {
  description = "The name of the NAT configuration"
  type        = string
}
