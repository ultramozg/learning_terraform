terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}

  subscription_id = "02b20795-af5d-43bf-b6b6-e9f4e231a788"
  client_id       = "c3efce2e-281e-49a1-a37c-4a73b53086d0"
  client_secret   = var.client_secret
  tenant_id       = "eac6c7bf-5c15-44bb-aec8-7a9c752e9876"
}

resource "azurerm_resource_group" "rg" {
  name = "test_resource_group_name"
  location = "West Europe"
}