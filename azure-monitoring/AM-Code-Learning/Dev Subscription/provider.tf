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
 subscription_id = "a86c54d3-8722-41d7-aebe-6b1106f49431"
}

  

