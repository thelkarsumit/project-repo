data "azurerm_application_gateway" "application_gateway" {
  count = length(var.app_gateway_name)
  name  = var.app_gateway_name[count.index]
  resource_group_name = var.app_gateway_rg_name[count.index]
}


resource "azurerm_monitor_activity_log_alert" "resource_health_alert" {
  name                = "Alert-AM-Dev-Subscription-AppGateway-ResourceHealth"
  resource_group_name = var.rg_name
  scopes              = ["/subscriptions/a86c54d3-8722-41d7-aebe-6b1106f49431"]
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