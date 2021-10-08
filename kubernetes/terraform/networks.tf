## Dev
# VPC
resource "google_compute_network" "dev_vpc" {
  name                    = "${var.gcp_project_id}-dev-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "dev_subnet" {
  name          = "${var.gcp_project_id}-dev-subnet"
  region        = var.gcp_region
  network       = google_compute_network.dev_vpc.name
  ip_cidr_range = "10.11.0.0/24"
}

## Prod
# VPC
resource "google_compute_network" "prod_vpc" {
  name                    = "${var.gcp_project_id}-prod-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "prod_subnet" {
  name          = "${var.gcp_project_id}-prod-subnet"
  region        = var.gcp_region
  network       = google_compute_network.prod_vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
