resource "azurerm_virtual_network" "example" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["172.16.0.0/16"]
  dns_servers         = ["172.16.0.4", "172.16.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example.id
    enable = true
  }

  subnet {
    name           = "frontend"
    address_prefix = "172.16.0.0/16"
  }
  /*
  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.example.id
  }
  */

  tags = {
    environment = var.environment
  }
}