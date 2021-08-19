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

variable network_docker_bridge_cidr {
  default = "172.17.0.1/16"
}

variable network_dns_service_ip {
  default = "10.65.0.10"
}

variable network_service_cidr {
  default = "10.65.0.0/16"
}

variable helm_charts {
  default = {
    chaos-mesh = {
      repository = "https://charts.chaos-mesh.org"
      chart = "chaos-mesh"
      namespace = "chaos-testing"
      version = "2.0.0"
      values = {
        service_type = {
          name  = "service.type"
          value = "ClusterIP"
        }
      }
    }
  }
}

variable azure_policy {
  type = object({
    enabled = bool
    policies = map(object({
      effect = string #audit|deny|disabled
      name = string
      excludedNamespaces = list(string)
    }))
  })
  default = {
    enabled = true
    policies = {
      use_only_internal_lb = {
        effect = "audit"
        # This name should be match one of the following pre-defined policies
        # https://docs.microsoft.com/en-us/azure/aks/policy-reference
        name = "Kubernetes clusters should use internal load balancers"
        excludedNamespaces = [
          "kube-system",
          "gatekeeper-system",
          "azure-arc",
          "test"
        ]
      }
    }
  }
}