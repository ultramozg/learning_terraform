resource "azurerm_resource_group" "myresourcegroup" {
  name = "myResourceGroup"
  location = var.location

  tags = {
    environment = "Terraform Demo"
  }
}