variable "vpc_name" {
  type = string
  description = "This is name of vpc that we want to create in project"
}
variable "project_id" {
  type = string
  description = "This is project id where we want to create vpc network"
}
variable "subnets" {
  description = "This is subnets that we want to create in vpc network"
  type = list(object({
    name                      = string
    cidr_block                = string
    region                    = string
    private_ip_google_access  = bool
  }))
}
