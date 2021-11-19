resource "kubernetes_namespace" "services_prod_gke_namespace" {
  provider = kubernetes.prod
  metadata {
    name = var.prod_k8_services_namespace_name
  }
}
resource "kubernetes_namespace" "infrastructure_prod_gke_namespace" {
  provider = kubernetes.prod
  metadata {
    name = var.prod_k8_infrastructure_namespace_name
  }
}

resource "kubernetes_namespace" "services_dev_gke_namespace" {
  provider = kubernetes.dev
  metadata {
    name = var.dev_k8_services_namespace_name
  }
}
resource "kubernetes_namespace" "infrastructure_dev_gke_namespace" {
  provider = kubernetes.dev
  metadata {
    name = var.dev_k8_infrastructure_namespace_name
  }
}
