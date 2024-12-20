variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}
variable "project_id" {
  type = string
}
variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name                      = string
    cidr_block                = string
    region                    = string
    private_ip_google_access  = bool
  }))
}
