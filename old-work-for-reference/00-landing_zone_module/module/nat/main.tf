resource "google_compute_router" "nat-router" {
  name    = var.router_name
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "nat_config" {
  name                               = var.nat_name
  router                             = var.router_name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


