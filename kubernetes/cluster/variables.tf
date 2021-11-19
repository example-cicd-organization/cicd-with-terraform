# Dev
variable "dev_gcp_project_id" {
  type = string
  description = "GCP Project id for dev"
}
variable "dev_gcp_region" {
  type = string
  description = "GCP Region for dev"
}

# Prod
variable "prod_gcp_project_id" {
  type = string
  description = "GCP Project id for prod"
}
variable "prod_gcp_region" {
  type = string
  description = "GCP Region for prod"
}

# Common
variable "k8_default_cidr" {
  type = string
  description = "GKE cidr range"
}
