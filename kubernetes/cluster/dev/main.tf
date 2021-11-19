# GKE cluster
data "google_client_config" "default" {}
resource "google_container_cluster" "dev_gke" {
  provider = google-beta
  location = var.gcp_region
  project = var.gcp_project_id
  name     = "${var.gcp_project_id}-gke"
  enable_autopilot = true
  network    = google_compute_network.dev_vpc.name
  subnetwork = google_compute_subnetwork.dev_subnet.name
}

