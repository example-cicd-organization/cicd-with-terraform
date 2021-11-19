# Namespace
resource "kubernetes_namespace" "agents_gke_namespace" {
  metadata {
    name = var.cloud_agents_k8_namespace
  }
}

# RBAC
resource "kubernetes_service_account" "master_service_account" {
  metadata {
    name = "${var.master_name}-service-account"
    namespace = var.master_k8_namespace
  }
}
resource "kubernetes_role" "master_role" {
  metadata {
    name      = "${var.master_name}-role"
    namespace = var.master_k8_namespace
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["create","delete","get","list","patch","update","watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods/exec"]
    verbs      = ["create","delete","get","list","patch","update","watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods/log"]
    verbs      = ["get","list","watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get"]
  }
}

resource "kubernetes_role_binding" "master_role_binding" {
  depends_on = [kubernetes_service_account.master_service_account, kubernetes_role.master_role]
  metadata {
    name      = "${var.master_name}-role-binding"
    namespace = var.master_k8_namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.master_role.metadata.0.name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.master_service_account.metadata.0.name
    namespace = var.master_k8_namespace
  }
}

