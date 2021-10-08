packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "docker" "jenkins_master" {
  image = var.base_image
  export_path = "tmp_jenkins_master.tar"
}

build {
  sources = [
    "source.docker.jenkins_master"
  ]

  provisioner "shell" {
    inline = [
      "echo 'Setup Jenkins plugins...'",
      "jenkins-plugin-cli --help",
      "echo 'Setup Jenkins plugins finished'",
    ]
  }
  provisioner "shell" {
    inline = [
      "echo 'Install Jenkins plugins...'",
      "echo 'Install Jenkins plugins finished'",
    ]
  }

  provisioner "shell" {
    inline = [
      "echo 'Webhook with github organization...'",
      "echo 'Webhook with github organization finished'",
    ]
  }
  post-processors {
    post-processor "docker-import" {
      repository = "${var.dockerhub_organization}/${var.dockerhub_repository}"
      tag = "latest"
    }
    post-processor "docker-tag" {
      repository = "${var.dockerhub_organization}/${var.dockerhub_repository}"
      tags = [
        "${var.version}",
        "latest"]
    }
    post-processor "docker-push" {
      login = true
      login_username = var.dockerhub_username
      login_password = var.dockerhub_password
    }
  }
}

