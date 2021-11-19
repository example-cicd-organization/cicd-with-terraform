terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.63.0"
    }
    google-beta = {
      source  = "hashicorp/google"
      version = ">= 3.63.0"
    }
  }
}
