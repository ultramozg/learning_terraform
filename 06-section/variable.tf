variable "k8s" {
  description = "This variable holds information about the kubernetes configuration"
  type        = map(any)
  default = {
    name               = "ssh-aks-nonprod"
    rg                 = "ssh-core-rg"
    environment        = "test"
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip     = "10.65.0.10"
    service_cidr       = "10.65.0.0/16"
  }
}

variable "logs_analytics_workspace" {
  default = {
    name = "DefaultWorkspace-0a277bdd-294c-4772-b5b0-2e57623e7175-SUK"
    rg_name = "defaultresourcegroup-suk"
  }
}