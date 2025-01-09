module "vpc" {
  source = "../../module/vpc"
  vpc_name = var.vpc_name
  project_id = var.project_id
  subnets = var.subnets
}

module "nat" {
  source = "../../module/nat"
  depends_on = [ module.vpc ]
  router_name = var.router_name
  nat_name = var.nat_name
  region = var.region
  network = var.vpc_name
  subnetwork_name = var.router_subnetwork_name
}

module "firewall_rules" {
  source = "../../module/firewall_rules"
  depends_on = [ module.vpc ]
  firewall_rules = var.firewall_rules
}

module "vm" {
  source = "../../module/vm"
  depends_on = [ module.vpc]
  vm_name = var.vm_name
  machine_type = var.machine_type
  zone = var.zone
  project_id = var.project_id
  image = var.image
  network = var.vpc_name
  subnetwork = var.vm_subnetwork_name
  subnetwork_project = var.subnetwork_project
  metadata_startup_script = "${file("/home/thelkar_sumit/landing_zone_module/temp/jenkins-private-server-temp/startup_script.sh")}" 
}
