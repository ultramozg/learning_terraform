resource "azurerm_log_analytics_workspace" "insights" {
  name                = var.logs_analytics_workspace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  retention_in_days   = 30
}