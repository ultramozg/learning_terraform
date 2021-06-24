resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.k8s_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "devaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    availability_zones = [1 ,2, 3]
    vm_size    = "Standard_B2ms"
    //vnet_subnet_id = azurerm_subnet.frontend.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    docker_bridge_cidr = var.network_docker_bridge_cidr
    dns_service_ip     = var.network_dns_service_ip
    service_cidr       = var.network_service_cidr
  }

  addon_profile {
    azure_policy { enabled = false }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.insights.id
    }
  }

  tags = {
    Environment = var.environment
  }
}