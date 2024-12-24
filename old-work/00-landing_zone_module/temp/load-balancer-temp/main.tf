module "load_balancer" {
  source = "../../module/load-balancer"
  name_prefix = var.name_prefix
}