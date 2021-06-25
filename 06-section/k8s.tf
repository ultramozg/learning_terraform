resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.k8s_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "ssh-aks-nonprod-dns"

  addon_profile {
    azure_policy { enabled = false }
    http_application_routing { enabled = false }
    ingress_application_gateway { enabled = false }

    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.insights.id
    }
  }

  default_node_pool {
    name               = "agentpool2"
    node_count         = 1
    availability_zones = [1, 2, 3]
    vm_size            = "Standard_B2ms"
    vnet_subnet_id     = data.azurerm_subnet.frontend.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
  }
}