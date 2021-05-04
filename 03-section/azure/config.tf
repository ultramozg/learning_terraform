terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-westeurope"
    storage_account_name = "terraformstoragebucket"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}