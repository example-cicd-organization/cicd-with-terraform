terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
      configuration_aliases = [ kubernetes.dev, kubernetes.prod ]
    }
  }
}
