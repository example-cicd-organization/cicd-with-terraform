output "k8_cluster_name" {
  value = google_container_cluster.dev_gke.name
  description = "GKE Cluster Name"
}

output "k8_cluster_host" {
  value = google_container_cluster.dev_gke.endpoint
  description = "GKE Cluster Host"
}

output "k8_cluster_certificate_base64" {
  value = google_container_cluster.dev_gke.master_auth.0.cluster_ca_certificate
  description = "GKE Cluster Certificate decoded in base64"
}

output "k8_cluster_client_certificate_base64" {
  value = google_container_cluster.dev_gke.master_auth.0.client_certificate
  description = "GKE Cluster Client certificate decoded in base64"
}

output "k8_cluster_client_key_base64" {
  value = google_container_cluster.dev_gke.master_auth.0.client_key
  description = "GKE Cluster Client key decoded in base64"
}

output "k8_cluster_access_token" {
  value = data.google_client_config.default.access_token
  description = "GKE cluster access token valid for 1h"
  sensitive = true
}
