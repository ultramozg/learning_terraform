//TODO there should be a security group for simplicity sake it was removed

resource "azurerm_virtual_network" "frontend" {
  name                = "frontend"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["172.16.0.0/16"]
  dns_servers         = ["172.16.0.4", "172.16.0.5"]

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
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.frontend.name
  address_prefixes     = ["172.16.0.0/16"]
}