module "nat" {
  source = "../../module/nat"
  router_name = var.router_name
  region = var.region
  network = var.network
  nat_name = var.nat_name
  subnetwork_name = var.subnetwork_name
}