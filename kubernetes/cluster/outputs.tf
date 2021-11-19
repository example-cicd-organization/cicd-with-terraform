# Dev
output "dev_k8_cluster_host" {
  value       = module.dev.k8_cluster_host
  description = "GKE Dev Cluster Host"
}

output "dev_k8_cluster_certificate_base64" {
  value       = module.dev.k8_cluster_certificate_base64
  description = "GKE Dev Cluster Certificate decoded in base64"
}

output "dev_k8_cluster_client_certificate_base64" {
  value       = module.dev.k8_cluster_client_certificate_base64
  description = "GKE Dev Cluster Client certificate decoded in base64"
}

output "dev_k8_cluster_client_key_base64" {
  value       = module.dev.k8_cluster_client_key_base64
  description = "GKE Dev Cluster Client key decoded in base64"
  sensitive = true
}

output "dev_k8_cluster_access_token" {
  value = module.dev.k8_cluster_access_token
  description = "GKE Dev Cluster Access token valid for 1 h"
  sensitive = true
}

# Prod
output "prod_k8_cluster_host" {
  value       = module.prod.k8_cluster_host
  description = "GKE Prod Cluster Host"
}

output "prod_k8_cluster_certificate_base64" {
  value       = module.prod.k8_cluster_certificate_base64
  description = "GKE Prod Cluster Certificate decoded in base64"
}

output "prod_k8_cluster_client_certificate_base64" {
  value       = module.prod.k8_cluster_client_certificate_base64
  description = "GKE Prod Cluster Client certificate decoded in base64"
}

output "prod_k8_cluster_client_key_base64" {
  value       = module.prod.k8_cluster_client_key_base64
  description = "GKE Prod Cluster Client key decoded in base64"
  sensitive = true
}

output "prod_k8_cluster_access_token" {
  value = module.prod.k8_cluster_access_token
  description = "GKE Prod Cluster Access token valid for 1 h"
  sensitive = true
}
