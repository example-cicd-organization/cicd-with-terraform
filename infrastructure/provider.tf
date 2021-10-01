variable "project_id" {
  type = string
  description = "project id"
}

variable "region" {
  type = string
  description = "region"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}