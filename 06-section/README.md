To import the resources which previously weren't created by terraform we should use something below, again after we only have imported them into the tfstate file, but not the end of the story, after that we should explicitly configure them into the Terraform code, so the weren't be destroyed/changed by accident.

```bash
terraform import azurerm_virtual_network.frontend /subscriptions/0a277bdd-294c-4772-b5b0-2e57623e7175/resourceGroups/ssh-core-rg/providers/Microsoft.Network/virtualNetworks/ssh-aks-nonprod-vnet
azurerm_virtual_network.frontend: Importing from ID "/subscriptions/0a277bdd-294c-4772-b5b0-2e57623e7175/resourceGroups/ssh-core-rg/providers/Microsoft.Network/virtualNetworks/ssh-aks-nonprod-vnet"...
azurerm_virtual_network.frontend: Import prepared!
  Prepared azurerm_virtual_network for import
azurerm_virtual_network.frontend: Refreshing state... [id=/subscriptions/0a277bdd-294c-4772-b5b0-2e57623e7175/resourceGroups/ssh-core-rg/providers/Microsoft.Network/virtualNetworks/ssh-aks-nonprod-vnet]
```