resource "azurerm_monitor_metric_alert" "clusterhealth" {
  for_each = var.metric_alert
  name                = "Alert-AM-Prod-Subscription-AKS-ClusterHealth-${each.key}-Warning"
  resource_group_name =  var.rg_name
  scopes =            ["/subscriptions/345e20b6-de8c-40ad-a8bf-3cf4ef613659/resourceGroups/${each.value.rg_name}/providers/Microsoft.ContainerService/managedClusters/${each.value.kubernetes_name}"]
  description         = var.description
  severity            = var.severity
  
  
  criteria {
    metric_namespace  = "Microsoft.ContainerService/ManagedClusters"
    metric_name       = var.metric_name
    operator          = var.operator
    threshold         = var.threshold
    aggregation       = var.aggregation
    
  }
  action {
    action_group_id = var.action_group_id
  }
  
frequency = "PT5M"


}