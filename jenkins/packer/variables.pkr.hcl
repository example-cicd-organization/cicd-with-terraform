variable "dockerhub_organization" {
  type = string
  description = "Dockerhub organization name to upload image"
}
variable "dockerhub_repository" {
  type = string
  description = "Dockerhub repo"
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
variable "version" {
  type = string
  description = "Version to push image"
}
variable "k8_cloud_agents_name" {
  type = string
  default = "K8-agents"
  description = "Kubernetes Cloud name"
}
variable "k8_cloud_agents_url" {
  type = string
  description = "Kubernetes Cloud URL"
}
variable "k8_cloud_agents_namespace" {
  type = string
  description = "Kubernetes Cloud namespace"
}
variable "k8_cloud_agents_certificate_base64" {
  type = string
  description = "Kubernetes Cloud certificate base64 encoded"
}

# Defaults
variable "base_image" {
  type = string
  default = "jenkins/jenkins:lts-jdk11"
}
variable "admin_user" {
  type = string
  description = "Jenkins' default admin user"
}
variable "admin_password" {
  type = string
  description = "Jenkins' default admin password"
  sensitive = true
}
