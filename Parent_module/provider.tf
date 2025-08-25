terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "aks-rg"
    storage_account_name = "myone21"
    container_name       = "lalli2"
    key                  = "git.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2775dd26-3d9b-4b17-b5d0-b8edea927622"
}