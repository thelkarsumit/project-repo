project_id = "sumit-project-05032025"
firewall_rules = {
  "iap-desktop-linux-os" = {
    name = "iap-desktop-linux-rule"
    network = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["35.235.240.0/20"]
  },
  "iap-desktop-windows-os" = {
    name = "iap-desktop-windows-rule"
    network = "vpc-learning-test-001"
    protocol      = "tcp"
    ports         = ["3389"]
    source_ranges = ["35.235.240.0/20"]
  }
}