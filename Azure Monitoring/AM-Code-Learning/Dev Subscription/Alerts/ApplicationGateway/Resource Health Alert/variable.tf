variable "action_group_id" {
  description = "Action Group Id"
}
variable "rg_name" {
  
}
variable "category" {
    type = string
  default = "ResourceHealth"
}
variable "description" {
    type = string
  default = "Resource Health Alert"
}
variable "app_gateway_name" {
  default = ["devneakscluster-appgateway","ingress-appgateway","ingress-appgateway"]
}
variable "app_gateway_rg_name" {
  default = ["MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope","MC_DEV-CI-AKS-RG-GB-001_devciakscluster001_centralindia","MC_DEV-NE-AKS-RG-GB-001_devneakscluster001_northeurope"]
}
