variable "gke_username" {
  type = string
  description = "gke username"
}

variable "gke_password" {
  type = string
  description = "gke password"
}

# GKE cluster
resource "google_container_cluster" "dev" {
  provider = google-beta
  name     = "${var.project_id}-dev-gke"
  location = var.region

  enable_autopilot = true

  network    = google_compute_network.dev_vpc.name
  subnetwork = google_compute_subnetwork.dev_subnet.name
}

# GKE cluster
resource "google_container_cluster" "prod" {
  provider = google-beta
  name     = "${var.project_id}-prod-gke"
  location = var.region

  enable_autopilot = true

  network    = google_compute_network.prod_vpc.name
  subnetwork = google_compute_subnetwork.prod_subnet.name
}