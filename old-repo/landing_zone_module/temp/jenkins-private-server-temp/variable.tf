variable "vpc_name" {
  type = string
}
variable "router_name" {
  type = string
}
variable "nat_name" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "router_subnetwork_name" {
  type = string
}
variable "region" {
  type = string
}
variable "vm_subnetwork_name" {
  type = string
}
variable "subnets" {
  type = list(object({
    name = string
    cidr_block = string
    region = string
    private_ip_google_access = bool 
  }))
}
variable "firewall_rules" {
  type = map(object({
    name = string
    network = string
    protocol = string
    ports = list(string)
    source_ranges = list(string)
  }))
}
variable "machine_type" {
  type = string
}
variable "zone" {
  type = string
}
variable "project_id" {
  type = string
}
variable "image" {
  type = string
}
variable "subnetwork_project" {
  type = string
}

/* variable "metadata_startup_script" {
  type = any
} */



