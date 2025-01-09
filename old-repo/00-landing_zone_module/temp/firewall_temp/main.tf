module "firewall_rules" {
  source = "../../module/firewall_rules" 
  firewall_rules = var.firewall_rules
}