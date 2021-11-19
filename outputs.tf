output "dev_k8_certificate_base64" {
  value = module.kubernetes.dev_k8_cluster_certificate_base64
}
output "prod_k8_certificate_base64" {
  value = module.kubernetes.prod_k8_cluster_certificate_base64
}
