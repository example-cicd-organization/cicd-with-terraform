output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_dev_cluster_name" {
  value       = google_container_cluster.dev.name
  description = "GKE Dev Cluster Name"
}

output "kubernetes_dev_cluster_host" {
  value       = google_container_cluster.dev.endpoint
  description = "GKE Dev Cluster Host"
}

output "kubernetes_prod_cluster_name" {
  value       = google_container_cluster.prod.name
  description = "GKE Prod Cluster Name"
}

output "kubernetes_prod_cluster_host" {
  value       = google_container_cluster.prod.endpoint
  description = "GKE Prod Cluster Host"
}
