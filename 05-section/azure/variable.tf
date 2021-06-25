variable resource_group_name {
  default = "dev-aks-rg"
}

variable location {
  default = "uksouth"
}

variable environment {
  default = "dev"
}

variable k8s_name {
  default = "ssh-aks-dev"
}

variable logs_analytics_workspace_name {
  default = ""
}

variable network_docker_bridge_cidr {
  default = "172.17.0.1/16"
}

variable network_dns_service_ip {
  default = "10.65.0.10"
}

variable network_service_cidr {
  default = "10.65.0.0/16"
}