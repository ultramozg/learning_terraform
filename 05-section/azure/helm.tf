resource "helm_release" "chaos-mesh" {
  name             = "chaos-mesh"
  repository       = "https://charts.chaos-mesh.org"
  chart            = "chaos-mesh"
  namespace        = "chaos-testing"
  create_namespace = true
  version          = "2.0.0"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}