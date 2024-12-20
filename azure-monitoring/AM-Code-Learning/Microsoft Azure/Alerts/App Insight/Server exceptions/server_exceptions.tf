resource "azurerm_monitor_metric_alert" "serverexceptions_alert" {

  for_each = var.metric_alert

  name =  "Alert-AM-Hub-Subscription-AppInsight-ServerExceptions-${each.key}"

  resource_group_name = var.rg_name

  scopes = ["/subscriptions/fe8607f3-f657-4c44-af82-f50b0693554a/resourceGroups/${each.value.rg_name}/providers/microsoft.insights/components/${each.value.insight_name}"]

  severity = each.value.severity
  description = var.description

  criteria {

    metric_namespace = "microsoft.insights/components"

    metric_name = var.metric_name

    aggregation = var.aggregation

    operator = var.operator

    threshold = each.value.threshold

  }

  action {

    action_group_id = var.action_group_id

  }
  window_size = "PT15M"
  frequency = "PT15M"

}