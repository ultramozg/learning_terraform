data "azurerm_resource_group" "rg" {
  name = var.k8s["rg"]
}

data "azurerm_log_analytics_workspace" "insights" {
  name                = var.logs_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_rg_name
}