output "router_name" {
  description = "Name of the Cloud Router"
  value       = google_compute_router.nat-router.name
}

output "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  value       = google_compute_router_nat.nat_config.name
}
