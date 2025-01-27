resource "azurerm_monitor_metric_alert" "Disk_Percentage" {
  for_each = var.metric_alert
  name                = "Alert-AM-Hub-Subscription-AKS-Disk-Percentage-${each.key}"
  resource_group_name =  var.rg_name
  scopes =            ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.rg_name}/providers/Microsoft.ContainerService/managedClusters/${each.value.kubernetes_name}"]
  description         = var.description
  severity            = each.value.severity
  
  
  criteria {
    metric_namespace  = "Microsoft.ContainerService/ManagedClusters"
    metric_name       = var.metric_name
    operator          = var.operator
    threshold         = each.value.threshold
    aggregation       = var.aggregation
    
  }
  action {
    action_group_id = var.action_group_id
  }
  
frequency = "PT5M"


}