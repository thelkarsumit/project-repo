variable "vm_name" {
  description = "Name of the VM"
  type        = string
}
 
variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-medium"
}
variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}
 
variable "project_id" {
  description = "GCP project ID"
  type        = string
}
 
variable "image" {
  description = "Image to use for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}
variable "network" {
  description = "Network to attach to the VM"
  type        = string
  default     = "default"
}
variable "subnetwork" {
  description = "Subnetwork to attach to the VM"
  type        = string
  default     = "default"
}
variable "subnetwork_project" {
   description = "Subnetwork to attach to the VM"
  type         = string
  default      = "default" 
}
variable "metadata_startup_script" {
  type = any
}