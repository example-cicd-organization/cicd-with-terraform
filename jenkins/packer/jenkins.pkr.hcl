packer {
  required_plugins {
    docker = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "jenkins_lts" {
  image = "jenkins/jenkins:lts-jdk11"
  commit = true
  // JAVA_OPTS -Djenkins.install.runSetupWizard=false so Jenkins skips the wizard configuration
  // ENVs variables are used by groovy scripts
  // ENTRYPOINT to keep original entrypoint at image jenkins/jenkins:lts-jdk11
  changes = [
    "ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false",
    "ENV JENKINS_USER ${var.admin_user}",
    "ENV JENKINS_PASSWORD ${var.admin_password}",
    "ENV K8_CLOUD_AGENTS_NAME ${var.k8_cloud_agents_name}",
    "ENV K8_CLOUD_AGENTS_NAMESPACE ${var.k8_cloud_agents_namespace}",
    "ENV K8_CLOUD_AGENTS_URL ${var.k8_cloud_agents_url}",
    "ENV K8_CLOUD_AGENTS_CERTIFICATE_BASE64 ${var.k8_cloud_agents_certificate_base64}",
    "ENTRYPOINT [\"/sbin/tini\", \"--\", \"/usr/local/bin/jenkins.sh\"]"
  ]
}

build {
  name = "jenkins_master"
  sources = ["source.docker.jenkins_lts"]

  provisioner "file" {
    source = "./scripts/default-user.groovy"
    destination = "/usr/share/jenkins/ref/init.groovy.d/"
  }

  provisioner "file" {
    source = "./scripts/k8.groovy"
    destination = "/usr/share/jenkins/ref/init.groovy.d/"
  }

  provisioner "file" {
    source = "./plugins.yaml"
    destination = "./tmp/plugins.yaml"
  }

  provisioner "shell" {
    inline = [
      "echo 'Install Jenkins plugins...'",
      "jenkins-plugin-cli --plugin-file ./tmp/plugins.yaml --verbose",
      "echo 'Installed Jenkins plugins finished'",
    ]
  }
  post-processors {
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
