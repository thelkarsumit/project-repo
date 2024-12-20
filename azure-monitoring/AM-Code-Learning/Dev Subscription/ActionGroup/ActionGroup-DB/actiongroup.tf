resource "azurerm_monitor_action_group" "ag-db" {
  name                = var.action_group_name
  resource_group_name = var.rg_name
  short_name          = var.short_name
  
  dynamic "email_receiver"{
    for_each = var.email_reciever
    content {
      name = email_receiver.value.email_name
      email_address = email_receiver.value.email_address
      use_common_alert_schema = true
  }
}
}