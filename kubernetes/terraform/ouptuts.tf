output "kubernetes_dev_cluster_name" {
  value       = google_container_cluster.dev_gke.name
  description = "GKE Dev Cluster Name"
}

output "kubernetes_dev_cluster_host" {
  value       = google_container_cluster.dev_gke.endpoint
  description = "GKE Dev Cluster Host"
}

output "kubernetes_prod_cluster_name" {
  value       = google_container_cluster.prod_gke.name
  description = "GKE Prod Cluster Name"
}

output "kubernetes_prod_cluster_host" {
  value       = google_container_cluster.prod_gke.endpoint
  description = "GKE Prod Cluster Host"
}
