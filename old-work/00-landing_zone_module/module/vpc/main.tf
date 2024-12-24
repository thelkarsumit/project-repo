resource "google_compute_network" "vpc" {
  name        = var.vpc_name
  project     = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  depends_on = [ google_compute_network.vpc ]
  count                     = length(var.subnets)
  name                      = var.subnets[count.index].name
  network                   = google_compute_network.vpc.id
  ip_cidr_range             = var.subnets[count.index].cidr_block
  region                    = var.subnets[count.index].region
  private_ip_google_access  = var.subnets[count.index].private_ip_google_access
}
