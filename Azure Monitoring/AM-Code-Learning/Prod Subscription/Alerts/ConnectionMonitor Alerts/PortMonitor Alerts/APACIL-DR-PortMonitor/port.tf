resource "azurerm_monitor_scheduled_query_rules_alert_v2" "APACIL-DR-PortMonitor-Critical" {
  name                = "Alert-AM-Prod-Subscription-APACIL-DR-PortMonitor-Critical"
  resource_group_name = var.rg_name
  location            = var.deploy_location
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"
  scopes               = [var.workspace_resource_id]
  severity             = var.severity
  criteria {
    query                   = <<-QUERY

     NWConnectionMonitorTestResult
      | where TimeGenerated >= ago(2m)
      | where TestResult == "Warning" or TestResult == "Fail"
      | where TestGroupName == "APACIL-DR-TG-001"
      | project TimeGenerated, SourceName, DestinationName, DestinationPort, TestResult, TestGroupName, TestConfigurationName

       QUERY

     time_aggregation_method = var.time_aggregation_method
     threshold               = 0
     operator                = var.operator
    #resource_id_column    = "_ResourceId"

    dimension {

      name     = "DestinationName"

      operator = "Include"

      values   = ["*"]

    }
    dimension {

      name     = "SourceName"

      operator = "Include"

      values   = ["*"]

    }

    dimension {

      name     = "TestConfigurationName"

      operator = "Include"

      values   = ["*"]
    }
    
     dimension {

      name     = "DestinationPort"

      operator = "Include"

      values   = ["*"]

    }

    dimension {

      name     = "TestResult"

      operator = "Include"

      values   = ["*"]

    }

     dimension {

      name     = "TestGroupName"

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
  display_name                     = "Alert-AM-Prod-Subscription-APACIL-DR-PortMonitor-Critical"
  enabled                          = true
  skip_query_validation            = false
  action {
    action_groups =  [var.action_group_id]
  }

}