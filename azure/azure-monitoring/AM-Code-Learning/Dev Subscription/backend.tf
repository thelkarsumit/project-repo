terraform {
  backend "azurerm" {
      resource_group_name  = "RG-AM-Dev-Subscription"
      storage_account_name = "sadevsubscriptiontf"
      container_name       = "new-container"
      key                  = "terraform.tfstate"
  }
}