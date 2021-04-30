resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.myresourcegroup.name

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = azurerm_resource_group.myresourcegroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.myresourcegroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}