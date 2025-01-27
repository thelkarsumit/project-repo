data "azurerm_monitor_action_group" "ag3" {
  name = "AG-AM-PRD-Subscription-APPS"
  resource_group_name = "rg-am-prod-subscription"
}
