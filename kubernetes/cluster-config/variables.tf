# Dev
variable "dev_k8_services_namespace_name" {
  type = string
  description = "GKE namespace name for services in dev"
}
variable "dev_k8_infrastructure_namespace_name" {
  type = string
  description = "GKE namespace name for infrastructure in dev"
}

# Prod
variable "prod_k8_services_namespace_name" {
  type = string
  description = "GKE namespace name for services in prod"
}
variable "prod_k8_infrastructure_namespace_name" {
  type = string
  description = "GKE namespace name for infrastructure in prod"
}
