data "azurerm_recovery_services_vault" "vault1" {
  count = length(var.recovery_service_vault_names)
  name                = var.recovery_service_vault_names[count.index]
  resource_group_name = var.recovery_rg_names[count.index]
}

resource "azurerm_monitor_metric_alert" "backup_alert_si" {
    name= "Alert-AM-Prod-Subscription-Backup-Failure-Critical-SouthIndia"
    resource_group_name = var.rg_name
    scopes = toset(data.azurerm_recovery_services_vault.vault1[*].id)  
    severity = var.severity
   
    frequency = "PT15M"
    window_size = "PT15M"
    target_resource_location = "South India"
    target_resource_type = "Microsoft.RecoveryServices/vaults"

    
    criteria {
    metric_namespace = "Microsoft.RecoveryServices/vaults"
    metric_name      = var.metric_name
    aggregation      = var.time_aggregation_method
    operator         = var.operator
    threshold        = var.threshold
    dimension{
       name = "healthStatus" 
       operator = "Include"
       values = ["PersistentDegraded","TransientDegraded","TransientUnhealthy"]
    }
    dimension{
       name = "backupInstanceName" 
       operator = "Include"
       values = ["*"]
    }
    }
    
     action {

    action_group_id = var.action_group_id

  }
    }





