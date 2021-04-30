provider "azurerm" {
  features {}

  subscription_id = var.credentials["subscription_id"]
  client_id       = var.credentials["client_id"]
  tenant_id       = var.credentials["tenant_id"]
}