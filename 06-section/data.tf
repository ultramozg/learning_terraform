data "azurerm_resource_group" "rg" {
  name = var.k8s["rg"]
}

data "azurerm_log_analytics_workspace" "insights" {
  name                = var.logs_analytics_workspace["name"]
  resource_group_name = var.logs_analytics_workspace["rg_name"]
}