terraform {
  backend "azurerm" {
      resource_group_name  = "RG-AM-Prod-Subscription"
      storage_account_name = "saprodsubscriptiontf"
      container_name       = "new-container"
      key                  = "terraform.tfstate"
  }
}