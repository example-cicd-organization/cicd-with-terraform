# GKE cluster
resource "google_container_cluster" "dev_gke" {
  provider = google-beta
  name     = "${var.gcp_project_id}-dev-gke"
  location = var.gcp_region

  enable_autopilot = true

  network    = google_compute_network.dev_vpc.name
  subnetwork = google_compute_subnetwork.dev_subnet.name
}

# GKE cluster
resource "google_container_cluster" "prod_gke" {
  provider = google-beta
  name     = "${var.gcp_project_id}-prod-gke"
  location = var.gcp_region

  enable_autopilot = true

  network    = google_compute_network.prod_vpc.name
  subnetwork = google_compute_subnetwork.prod_subnet.name
}