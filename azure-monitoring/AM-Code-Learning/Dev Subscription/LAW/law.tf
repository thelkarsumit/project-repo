resource "azurerm_log_analytics_workspace" "law-Dev" {
  name                = var.law_name
  location            = var.deploy_location
  resource_group_name = var.rg_name
  
}