data "azurerm_application_gateway" "application_gateway" {
  count = length(var.app_gateway_name)
  name  = var.app_gateway_name[count.index]
  resource_group_name = var.app_gateway_rg_name[count.index]
}


resource "azurerm_monitor_activity_log_alert" "resource_health_alert" {
  name                = "Alert-AM-Prod-Subscription-AppGateway-ResourceHealth"
  resource_group_name = var.rg_name
  scopes              = ["/subscriptions/345e20b6-de8c-40ad-a8bf-3cf4ef613659"]
  description         = var.description
  
  criteria {
    resource_ids    = toset(data.azurerm_application_gateway.application_gateway[*].id)
     resource_type  = "Microsoft.Network/applicationGateways"     
    resource_groups = toset(data.azurerm_application_gateway.application_gateway[*].resource_group_name)
    category       = var.category
  
     resource_health {
         current = ["Degraded","Unavailable"]
         previous = ["Available"]
         reason = ["PlatformInitiated","UserInitiated","Unknown"]
    }
  }
  action {
    action_group_id = var.action_group_id
  }
   

}