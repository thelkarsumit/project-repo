terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

provider "azurerm" {
  features {}
 subscription_id = "345e20b6-de8c-40ad-a8bf-3cf4ef613659"
}

  

