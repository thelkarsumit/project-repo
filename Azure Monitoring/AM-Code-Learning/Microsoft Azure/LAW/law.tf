data "azurerm_log_analytics_workspace" "law-MicrosoftAzure" {
  name                = var.law_name
  resource_group_name = var.rg_name
}
