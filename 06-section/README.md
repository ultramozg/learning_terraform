To import the resources which previously weren't created by terraform we should use something below, again after we only have imported them into the tfstate file, but not the end of the story, after that we should explicitly configure them into the Terraform code, so the weren't be destroyed/changed by accident.

```bash
terraform import azurerm_virtual_network.frontend <RESOURCE_ID>
```