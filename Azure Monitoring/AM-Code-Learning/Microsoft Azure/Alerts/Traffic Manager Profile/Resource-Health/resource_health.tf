data "azurerm_traffic_manager_profile" "tfmanagerprofile" {
  count = length(var.trafficmanagerprofile)
  name                = var.trafficmanagerprofile[count.index]
  resource_group_name = var.trafficmanagerrgname[count.index]
}
resource "azurerm_monitor_activity_log_alert" "traffic_manager_profile_resource_health" {
  name                = "Alert-AM-Hub-Subscription-TrafficManagerProfile-ResourceHealth"
  resource_group_name = var.rg_name
  scopes              = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a"]
  description         = var.description
   criteria {  
     resource_type  = "Microsoft.Network/trafficManagerProfiles"     
    category       = var.category
    resource_groups = toset(data.azurerm_traffic_manager_profile.tfmanagerprofile[*].resource_group_name)
    resource_ids = toset(data.azurerm_traffic_manager_profile.tfmanagerprofile[*].id)
    
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