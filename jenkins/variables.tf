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
variable "image_version" {
  type = string
  description = "Version to push image"
}
variable "master_k8_namespace" {
  type = string
  description = "Namespace in K8 to host jenkins master instance and deploy pods"
}
variable "master_name" {
  type = string
  description = "Jenkins master instance name"
}
variable "cloud_agents_k8_namespace" {
  type = string
  description = "GKE namespace name to deploy jenkins agents"
}
variable "k8_cluster_endpoint" {
  type = string
  description = "Kubernetes endpoint so Jenkins can communicate to"
}
variable "k8_cluster_access_token" {
  type = string
  description = "Kubernetes access token"
  sensitive = true
}
variable "k8_cluster_certificate_base64" {
  type = string
  description = "Kubernetes cluster certificate encoded in base64"
}

# With defaults
// variable "vpc_cidr" {
//   type = string
//   default     = "10.0.0.0/16"
//   description = "VPC cidr block"
// }
// variable "public_subnet_cidr" {
//   default     = "10.0.0.0/24"
//   description = "Public Subnet cidr block (in vpc_cidr range)"
// }
// variable "private_subnet_cidr" {
//   default     = "10.0.1.0/24"
//   description = "Private Subnet cidr block (in vpc_cidr range)"
// }
// variable "aws_key_pair_name" {
//   default     = "jenkins-aws-key-pair-name"
//   description = "Jenkins's aws key pair name"
// }
variable "admin_user" {
  description = "Jenkins' default admin user"
}
variable "admin_password" {
  description = "Jenkins' default admin password"
}
variable "cloud_agents_name" {
  default = "jenkins-agents"
  description = "Jenkins' agents cloud name"
}
