resource "azurerm_monitor_metric_alert" "clusterhealth" {
  for_each = var.metric_alert
  name                = "Alert-AM-Dev-Subscription-AKS-ClusterHealth-${each.key}"
  resource_group_name =  var.rg_name
  scopes =            ["/subscriptions/a86c54d3-8722-41d7-aebe-6b1106f49431/resourceGroups/${each.value.rg_name}/providers/Microsoft.ContainerService/managedClusters/${each.value.kubernetes_name}"]
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