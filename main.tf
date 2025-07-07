# Mappia Deployment
resource "helm_release" "mappia" {
  name                  = var.name
  version               = var.chart_version
  repository            = "oci://mappia.azurecr.io/helm"
  chart                 = "mappia"
  wait                  = true
  timeout               = 600
  cleanup_on_fail       = true
  atomic                = true
  render_subchart_notes = false

  values = var.values

  set = [
    for k, v in merge(local.default_set_values, var.set_values) : {
      name  = k
      value = v
    }
  ]

}

locals {
  default_set_values = var.use_default_config ? {
    "magento.baseUrl"                = format("https://%s", var.host)
    "magento.adminUrl"               = format("https://%s", var.host)
    "api.ingress.hosts[0].host"      = var.host
    "admin.ingress.hosts[0].host"    = var.host
    "frontend.ingress.hosts[0].host" = var.host
  } : {}
}
