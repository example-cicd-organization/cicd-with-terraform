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
}
variable "version" {
  type = string
  description = "Version to push image"
}
variable "base_image" {
  type = string
  default = "jenkins/jenkins:lts-jdk11"
}
