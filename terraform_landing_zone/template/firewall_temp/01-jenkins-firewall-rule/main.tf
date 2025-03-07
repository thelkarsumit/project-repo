module "IAP-Desktop" {
  source = "../../../module/firewall_rules"
  firewall_rules = var.firewall_rules
}
provider "google" {
  project = var.project_id
  credentials = file("../../../../../sumit-project-05032025-network-admin.json")
}