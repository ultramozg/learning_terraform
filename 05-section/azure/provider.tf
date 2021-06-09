terraform {
  
  backend "azurerm" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}