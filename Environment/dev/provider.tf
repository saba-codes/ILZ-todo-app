terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "todo-ilz"
    storage_account_name = "todoilzstrg"
    container_name       = "todocontainer"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "30795018-f759-40ff-9c87-7d73f6cc4d87"
}


