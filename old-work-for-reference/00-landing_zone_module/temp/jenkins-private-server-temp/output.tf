output "vpc-details" {
  value = module.vpc
}
output "nat-details" {
  value = module.nat
}
output "firewall_rules-details" {
  value = module.firewall_rules
}
output "vm-details" {
  value = module.vm
}