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
 subscription_id = "fe8607f3-f657-4c44-af82-f50b0693554a"
}

