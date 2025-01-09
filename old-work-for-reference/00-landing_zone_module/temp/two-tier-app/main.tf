module "vpc" {
  source = "../../module/vpc"
  vpc_name = var.vpc_name
  subnets = var.subnets
  project_id = var.project_id
}

module "nat" {
  source = "../../module/nat"
  depends_on = [ module.vpc ]
  router_name = var.router_name
  nat_name = var.nat_name
  network = var.vpc_name
  subnetwork_name = var.subnetwork_name
  region = var.region
}

module "firewall" {
  source = "../../module/firewall_rules"
  depends_on = [ module.vpc ]
  firewall_rules = var.firewall_rules
}

module "mig" {
  source = "../../module/mig"
  depends_on = [ module.vpc ]
  name_prefix = var.name_prefix
  machine_type = var.machine_type
  region = var.region
  zone = var.zone
  source_image = var.source_image
  network = var.vpc_name
  subnetwork = var.subnetwork_name
  target_size = var.target_size
}
