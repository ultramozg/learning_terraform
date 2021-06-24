//TODO there should be a security group for simplicity sake it was removed

resource "azurerm_virtual_network" "frontend" {
  name                = "frontend"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.64.0.0/12"]

  /*
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example.id
    enable = true
  }
  */

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.frontend.name
  address_prefixes     = ["10.64.0.0/16"]
}
