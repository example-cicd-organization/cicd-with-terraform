## Prod
# VPC
resource "google_compute_network" "prod_vpc" {
  name                    = "${var.gcp_project_id}-vpc"
  auto_create_subnetworks = false
  project = var.gcp_project_id
}

# Subnet
resource "google_compute_subnetwork" "prod_subnet" {
  name          = "${var.gcp_project_id}-subnet"
  region        = var.gcp_region
  network       = google_compute_network.prod_vpc.name
  ip_cidr_range = var.k8_subnet_cidr
  project = var.gcp_project_id
}
