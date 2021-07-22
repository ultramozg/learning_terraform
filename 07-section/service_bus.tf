resource "azurerm_servicebus_namespace" "bus" {
  name                = var.service_bus["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  tags = {
    environment = var.environment
  }
}