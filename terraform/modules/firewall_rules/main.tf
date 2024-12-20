resource "google_compute_firewall" "firewall_rule" {
  for_each = var.firewall_rules

  name    = each.value.name
  network = each.value.network

    allow {
      protocol = each.value.protocol
      ports    = each.value.ports
          }

  source_ranges = each.value.source_ranges
}
                        