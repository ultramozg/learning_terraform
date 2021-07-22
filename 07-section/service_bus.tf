resource "azurerm_servicebus_namespace" "bus" {
  name                = var.service_bus["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_servicebus_queue" "example" {
  for_each = var.service_bus["queues"]
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.bus.name

  enable_partitioning = false
}