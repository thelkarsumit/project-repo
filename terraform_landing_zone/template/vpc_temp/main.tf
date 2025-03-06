provider "google" {
  credentials = file("../../../../sumit-project-05032025-network-admin.json")
  project     = "sumit-project-05032025"
}
module "vpc-network" {
 source = "../../module/vpc"
 vpc_name = var.vpc_name
 project_id = var.project_id
 subnets = var.subnets
}

