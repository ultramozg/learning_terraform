variable "credentials" {
    type = map
    default = {
      subscription_id = "02b20795-af5d-43bf-b6b6-e9f4e231a788"
      client_id = "c3efce2e-281e-49a1-a37c-4a73b53086d0"
      tenant_id = "eac6c7bf-5c15-44bb-aec8-7a9c752e9876"
    }
}

variable "location" {
    default = "westeurope"
}

variable "tags" {
 description = "A map of the tags to use for the resources that are deployed"
 type        = map(string)

 default = {
   environment = "codelab"
 }
}

variable "resource_group_name" {
 description = "The name of the resource group in which the resources will be created"
 default     = "myResourceGroup"
}

variable "application_port" {
   description = "The port that you want to expose to the external load balancer"
   default     = 80
}

variable "admin_user" {
   description = "User name to use as the admin account on the VMs that will be part of the VM Scale Set"
   default     = "azureuser"
}

variable "admin_password" {
   description = "Default password for admin account"
}
