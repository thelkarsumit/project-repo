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
  default = ["ingress-appgateway","ingress-appgateway","ingress-appgateway","ingress-appgateway"]
}
variable "app_gateway_rg_name" {
  default = ["MC_PRD-CI-AKS-RG-GB-001_pdciakscluster001_centralindia","MC_PRD-NE-AKS-RG-GB-001_pdneakscluster001_northeurope","MC_PRD-SI-AKS-RG-GB-001_pdsiakscluster001_southindia","MC_PRD-WE-AKS-RG-GB-001_pdweakscluster001_westeurope"]
}
