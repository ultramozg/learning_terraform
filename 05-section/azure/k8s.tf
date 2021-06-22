resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.k8s_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "devaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    availability_zones = [1 ,2, 3]
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standart"
  }

  vnet_subnet_id = frontend.id

  tags = {
    Environment = var.environment
  }
}