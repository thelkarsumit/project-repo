variable "vpc_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    name=string
    cidr_block=string
    region=string
    private_ip_google_access=bool
  }
  )
  )
}

variable "router_name" {
  type = string
}
variable "nat_name" {
  type = string
}
variable "subnetwork_name" {
  type = string
}
variable "region" {
  type = string
}
variable "firewall_rules" {
    type = map(object({
    name          = string
    network       = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
}))
}
variable "name_prefix" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "zone" {
  type = string
}
variable "source_image" {
  type = string
}
variable "network" {
  type = string
}
variable "target_size" {
  type = string
}
variable "project_id" {
  type = string
}