data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "insights" {
  name = var.logs_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_rg_name
}

data "azurerm_subnet" "frontend" {
  name = var.k8s_main_subnet_name
  virtual_network_name = "ssh-aks-nonprod-vnet"
  resource_group_name = "ssh-core-rg"
}