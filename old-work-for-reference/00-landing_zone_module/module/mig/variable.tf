variable "name_prefix" {
  description = "Prefix for instance template and MIG"
  type        = string
}

variable "machine_type" {
  description = "Machine type for instances"
  type        = string
  default     = "n1-standard-1"
}

variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "zone" {
  description = "Zone for the instance group"
  type        = string
}
variable "source_image" {
  description = "Source image for the instance template"
  type        = string
}
variable "network" {
  description = "Network for the instances"
  type        = string
}
variable "subnetwork" {
  description = "Network for the instances"
  type        = string
}
variable "target_size" {
  description = "Number of instances in the MIG"
  type        = number
}
                                  