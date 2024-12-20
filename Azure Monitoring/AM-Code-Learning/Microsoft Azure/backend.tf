terraform {
  backend "azurerm" {
      resource_group_name  = "RG-AM-Hub-Subscription"
      storage_account_name = "sahubsubscriptiontf"
      container_name       = "new-container"
      key                  = "terraform.tfstate"
  }
}