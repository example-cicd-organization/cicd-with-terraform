variable "aws_region" {
  type = string
  description = "Region"
}
variable "aws_identity" {
  type = string
  description = "Identity to use when performing aws cli commands"
}
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
}
variable "image_version" {
  type = string
  description = "Version to push image"
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC cidr block"
}

variable "public_subnet_cidr" {
  default     = "10.0.0.0/24"
  description = "Public Subnet cidr block (in vpc_cidr range)"
}
variable "private_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "Private Subnet cidr block (in vpc_cidr range)"
}

variable "aws_key_pair_name" {
  default     = "jenkins-aws-key-pair-name"
  description = "Jenkin's aws key pair name"
}
