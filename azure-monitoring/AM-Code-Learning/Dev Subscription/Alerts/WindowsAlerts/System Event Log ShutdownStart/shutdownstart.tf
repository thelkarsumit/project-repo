resource "azurerm_monitor_scheduled_query_rules_alert_v2" "startstopalert_v2" {
  name                = "Alert-AM-Dev-Subscription-Windows-Shutdown-Critical"
  resource_group_name = var.rg_name
  location            = var.deploy_location
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"

  scopes               = [var.workspace_resource_id]

  severity             = 0

  criteria {

    query                   = <<-QUERY

      Event
      | where EventID in (41, 1074, 6006, 6008) and _ResourceId != ""
      | project TimeGenerated, Computer, EventID, RenderedDescription,_ResourceId

       QUERY

     time_aggregation_method = "Count"
     

     threshold               = 0

     operator                = "GreaterThan"
      resource_id_column    = "_ResourceId"

   

    dimension {

      name     = "Computer"

      operator = "Include"

      values   = ["*"]

    }
    dimension {

      name     = "EventID"

      operator = "Include"

      values   = ["*"]

    }
    dimension {

      name     = "RenderedDescription"

      operator = "Include"

      values   = ["*"]

    }

    failing_periods {

      minimum_failing_periods_to_trigger_alert = 1

      number_of_evaluation_periods             = 1

    }

  }

 

  auto_mitigation_enabled          = true

  workspace_alerts_storage_enabled = false

  description                      = var.description

  display_name                     = "Alert-AM-Dev-Subscription-Windows-Shutdown-Critical"

  enabled                          = true

  skip_query_validation            = false

  action {

    action_groups =  [var.action_group_id]



  }

 

}