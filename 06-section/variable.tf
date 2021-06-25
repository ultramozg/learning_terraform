variable "k8s" {
  description = "This variable holds information about the kubernetes configuration"
  type = map
  default = {
    rg = "ssh-core-rg"
    dns_prefix = "ssh-aks-nonprod-dns"
    vnet_name = "ssh-aks-nonprod-vnet"
    environment = "test"
  }
}

variable "k8s_name" {
  default = "ssh-aks-nonprod"
}

variable "logs_analytics_workspace_name" {
  default = "DefaultWorkspace-0a277bdd-294c-4772-b5b0-2e57623e7175-SUK"
}

variable "log_analytics_workspace_rg_name" {
  default = "defaultresourcegroup-suk"
}

variable "network_docker_bridge_cidr" {
  default = "172.17.0.1/16"
}

variable "network_dns_service_ip" {
  default = "10.65.0.10"
}

variable "network_service_cidr" {
  default = "10.65.0.0/16"
}