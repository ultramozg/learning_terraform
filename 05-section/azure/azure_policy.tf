data "azurerm_policy_definition" "internal_lb" {
  display_name = "Kubernetes clusters should use internal load balancers"
}

resource "azurerm_resource_policy_assignment" "policy_assigment" {
    name = "audit-kubernetes-service"
    resource_id = azurerm_kubernetes_cluster.k8s.id
    policy_definition_id = data.azurerm_policy_definition.internal_lb.id
    parameters = <<PARAMETERS
    {
        "effect": {
            "value": "audit"
        },
        "excludedNamespaces": {
            "value": [
                "kube-system",
                "gatekeeper-system",
                "azure-arc"
            ]
        }
    }
PARAMETERS
}