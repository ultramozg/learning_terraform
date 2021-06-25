resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.k8s["name"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "${var.k8s["name"]}-dns"

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
    name                   = "agentpool2"
    vnet_subnet_id         = azurerm_subnet.main.id
    availability_zones     = [1, 2, 3]
    enable_auto_scaling    = false
    enable_host_encryption = false
    enable_node_public_ip  = false
    max_pods               = 110
    node_count             = 1
    vm_size                = "Standard_B2ms"
    os_disk_size_gb        = 128
    os_disk_type           = "Managed"
    orchestrator_version   = "1.20.5"
    type                   = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    dns_service_ip     = var.k8s["dns_service_ip"]
    docker_bridge_cidr = var.k8s["docker_bridge_cidr"]
    service_cidr       = var.k8s["service_cidr"]
    load_balancer_sku  = "Standard"
    network_plugin     = "azure"
    outbound_type      = "loadBalancer"
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.k8s["environment"]
  }
}