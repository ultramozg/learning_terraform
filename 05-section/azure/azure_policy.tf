data "azurerm_policy_definition" "internal_lb" {
  for_each = var.azure_policy.policies
  display_name = each.value.name
}

resource "azurerm_resource_policy_assignment" "policy_assigment" {
    for_each = var.azure_policy.policies
    name = each.value.name
    resource_id = azurerm_kubernetes_cluster.k8s.id
    policy_definition_id = data.azurerm_policy_definition.internal_lb[each.key].id
    parameters = <<PARAMETERS
    {
        "effect": {
            "value": "${each.value.effect}"
        },
        "excludedNamespaces": {
            "value": ${jsonencode(each.value.excludedNamespaces)}
        }
    }
PARAMETERS

    depends_on = [
        azurerm_kubernetes_cluster.k8s
    ]
}