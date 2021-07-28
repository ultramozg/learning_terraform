resource "helm_release" "chaos-mesh" {
  for_each         = var.helm_charts
  name             = each.key
  repository       = each.value.repository
  chart            = each.value.chart
  namespace        = each.value.namespace
  create_namespace = true
  version          = each.value.version

  dynamic "set" {
    for_each = each.value.values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}