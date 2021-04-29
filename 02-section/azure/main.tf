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

resource "azurerm_resource_group" "myresourcegroup" {
  name = "myResourceGroup"
  location = "West Europe"

  tags = {
    environment = "Terraform Demo"
  }
}

resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "West Europe"
    resource_group_name = azurerm_resource_group.myresourcegroup.name

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = azurerm_resource_group.myresourcegroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "Wast Europe"
    resource_group_name          = azurerm_resource_group.myresourcegroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}