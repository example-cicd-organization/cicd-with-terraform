variable "gcp_project_id" {
  type = string
  description = "GCP Project id"
}
variable "gcp_region" {
  type = string
  description = "GCP Region"
}
variable "k8_subnet_cidr" {
  type = string
  description = "GKE cidr range"
}
