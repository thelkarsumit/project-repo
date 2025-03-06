variable "project_id" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "image" {
  type = string
}
variable "subnetwork_project" {
  type = string
}
variable "subnetwork" {
  type = string
}
variable "zone" {
  type = string
}
variable "network" {
  type = string
}
variable "metadata_startup_script" {
  type = metadata_startup_script
}