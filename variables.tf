# Dockerhub
variable "dockerhub_organization" {
  type = string
  description = "Dockerhub organization name to upload images"
}
variable "dockerhub_repository" {
  type = string
  description = "Dockerhub repository"
}
variable "dockerhub_username" {
  type = string
  description = "Dockerhub username"
}
variable "dockerhub_password" {
  type = string
  description = "Dockerhub password"
  sensitive = true
}

# Kubernetes
variable "kubernetes_dev_gcp_project_id" {
  type = string
  description = "GCP Project id for GKE dev"
}
variable "kubernetes_dev_gcp_region" {
  type = string
  description = "GCP Region for GKE dev"
}
variable "kubernetes_prod_gcp_project_id" {
  type = string
  description = "GCP Project id for GKE prod"
}
variable "kubernetes_prod_gcp_region" {
  type = string
  description = "GCP Region for GKE prod"
}
variable "kubernetes_dev_infrastructure_namespace" {
  type = string
  description = "GKE dev infrastructure namespace"
}
variable "kubernetes_dev_services_namespace" {
  type = string
  description = "GKE dev services namespace"
}
variable "kubernetes_prod_infrastructure_namespace" {
  type = string
  description = "GKE prod infrastructure namespace"
}
variable "kubernetes_prod_services_namespace" {
  type = string
  description = "GKE prod services namespace"
}
variable "kubernetes_default_cidr" {
  type = string
  description = "GKE default subnet cidr"
}

# Jenkins
variable "jenkins_image_version" {
  type = string
  description = "Version to push image"
}
variable "jenkins_k8_cluster_jenkins_cloud_agents_namespace" {
  type = string
  description = "Kubernetes jenkins namespace to deploy pod agents"
}
variable "jenkins_master_name" {
  type = string
  description = "Jenkins master name"
}
variable "jenkins_admin_user" {
  type = string
  description = "Jenkins admin user"
}
variable "jenkins_admin_password" {
  type = string
  description = "Jenkins admin password"
}
