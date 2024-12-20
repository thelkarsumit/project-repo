resource "azurerm_monitor_metric_alert" "memory_Working_set_percentage" {
  for_each = var.metric_alert
  name                = "Alert-AM-Prod-Subscription-AKS-Memory-Workingset-percentage-${each.key}"
  resource_group_name =  var.rg_name
  scopes =            ["/subscriptions/345e20b6-de8c-40ad-a8bf-3cf4ef613659/resourceGroups/${each.value.rg_name}/providers/Microsoft.ContainerService/managedClusters/${each.value.kubernetes_name}"]
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