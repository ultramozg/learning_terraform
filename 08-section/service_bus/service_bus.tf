resource "azurerm_servicebus_namespace" "bus" {
  name                = var.service_bus["name"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.geo_recovery.enabled ? "Premium" : var.sku
  capacity            = var.geo_recovery.enabled ? var.geo_recovery.capacity : 0

  tags = {
    environment = var.environment
  }
}

resource "azurerm_servicebus_namespace" "secondary_bus" {
  name                = "${var.service_bus["name"]}-secondary"
  location            = var.failover_location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.geo_recovery.enabled ? "Premium" : var.sku
  capacity            = var.geo_recovery.enabled ? var.geo_recovery.capacity : 0

  tags = {
    environment = var.environment
  }

  count = var.geo_recovery.enabled ? 1 : 0
}

resource "azurerm_servicebus_namespace_disaster_recovery_config" "geo_recovery" {
  name                 = "servicebus-alias-name"
  primary_namespace_id = azurerm_servicebus_namespace.bus.id
  partner_namespace_id = azurerm_servicebus_namespace.secondary_bus[0].id

  count = var.geo_recovery.enabled ? 1 : 0
}

resource "azurerm_servicebus_queue" "example" {
  for_each = var.service_bus["queues"]
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  namespace_name      = azurerm_servicebus_namespace.bus.name

  # Queue params
  max_size_in_megabytes = each.value["max_size"]
  lock_duration         = each.value["lock_duration"]
  max_delivery_count    = each.value["max_delivery_count"]
  enable_partitioning   = each.value["enable_partitioning"]
}