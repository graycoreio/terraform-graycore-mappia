# Mappia Deployment
resource "helm_release" "mappia" {
  name            = var.name
  version         = "0.1.7"
  repository      = "oci://mappia.azurecr.io/helm"
  chart           = "mappia"
  wait            = true
  timeout         = 600
  cleanup_on_fail = true
  atomic          = true

  values = var.values

  # Magento config
  set {
    name  = "magento.baseUrl"
    value = format("https://%s", var.host)
  }
  set {
    name  = "magento.adminUrl"
    value = format("https://%s", var.host)
  }
  # Ingress config
  set {
    name  = "api.ingress.hosts[0].host"
    value = var.host
  }
  set {
    name  = "admin.ingress.hosts[0].host"
    value = var.host
  }
  set {
    name  = "admin.ingress.hosts[0].paths"
    value = "{/admin,/index.php/admin}"
  }
  set {
    name  = "api.ingressRoot.service.name"
    value = format("%s", var.name)
  }

  dynamic "set" {
    for_each = var.set_values

    content {
      name  = set.key
      value = set.value
    }
  }

}
