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
  default = ["DEV-CI-ICHEQUE-AGWAF-02","DEV-CI-ICLEAR-WAF-001","DEV-NE-MULTISITE-WAF-001","PD-CI-AKS-WAF-001","PD-CI-CTS-WAF-001","PD-CI-ICHEQUE-AG-WAF-01","PD-CI-ICHEQUE-AGWAF-02","PD-NE-IDMCRE-WAF-001","PD-SI-AKS-WAF-001","PD-SI-CTS-WAF-001","PD-SI-ICHEQUE-AG-WAF-01","PD-SI-ICHEQUE-AGWAF-02","PD-WE-IDMCRE-WAF-001","UAT-NE-MCHK-WAF-001"]
}
variable "app_gateway_rg_name" {
  default = ["DEV-CI-AGWAF-RG-02","HUB-CI-APSCN-RG-001","HUB-NE-WAF-RG-001","CI-RG-CoreNetwork-001","HUB-CI-WAF-RG-001","CI-RG-CoreNetwork-001","PRD-CI-ICHEQUE-AGWAF-RG-02","NE-RG-CoreNetwork-001","SI-RG-CoreNetwork-001","SI-RG-CoreNetwork-001","SI-RG-CoreNetwork-001","PRD-SI-ICHEQUE-AGWAF-RG-02","WE-RG-CoreNetwork-001","NE-RG-CoreNetwork-001" ]
}
