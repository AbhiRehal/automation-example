resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "qa" {
  metadata {
    name = "qa"
  }
}

# resource "kubernetes_secret" "ghcr_secret_dev" {
#   metadata {
#     name      = "ghcr-secret"
#     namespace = kubernetes_namespace.dev.metadata[0].name
#   }
#
#   type = "kubernetes.io/dockerconfigjson"
#
#   data = {
#     ".dockerconfigjson" = var.dockerconfigjson_base64
#   }
# }

# resource "kubernetes_secret" "ghcr_secret_qa" {
#   metadata {
#     name      = "ghcr-secret"
#     namespace = kubernetes_namespace.qa.metadata[0].name
#   }
#
#   type = "kubernetes.io/dockerconfigjson"
#
#   data = {
#     ".dockerconfigjson" = var.dockerconfigjson_base64
#   }
# }
