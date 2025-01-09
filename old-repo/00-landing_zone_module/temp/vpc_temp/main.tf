module "vpc" {
  source = "../../module/vpc"
  vpc_name = var.vpc_name
  subnets = var.subnets
}