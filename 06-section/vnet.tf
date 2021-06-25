//TODO there should be a security group for simplicity sake it was removed

resource "azurerm_virtual_network" "frontend" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.64.0.0/12"]

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "main" {
  name                 = var.k8s_main_subnet_name
  virtual_network_name = azurerm_virtual_network.frontend.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes     = ["10.64.0.0/16"]
}