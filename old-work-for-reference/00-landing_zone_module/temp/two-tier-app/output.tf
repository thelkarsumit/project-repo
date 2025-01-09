output "vpc" {
  value = module.vpc
}
output "nat" {
  value = module.nat
}
output "firewall_rules" {
  value = module.mig
}
output "mig" {
  value = module.mig
}