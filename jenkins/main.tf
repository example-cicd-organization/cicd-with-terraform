resource "null_resource" "packer_master" {
  triggers = {
    packer_file = sha1(file("${path.module}/packer/jenkins.pkr.hcl"))
  }
  provisioner "local-exec" {
    working_dir = "${path.module}/packer"
    command = "packer init ."
  }
  provisioner "local-exec" {
    working_dir = "${path.module}/packer"
    command = "packer build -var 'admin_user=${var.admin_user}' -var 'admin_password=${var.admin_password}' -var 'dockerhub_username=${var.dockerhub_username}' -var 'dockerhub_password=${var.dockerhub_password}' -var 'dockerhub_organization=${var.dockerhub_organization}' -var 'dockerhub_repository=${var.dockerhub_repository}' -var 'version=${var.image_version}' -var 'k8_cloud_agents_name=${var.cloud_agents_name}' -var 'k8_cloud_agents_url=${var.k8_cluster_endpoint}' -var 'k8_cloud_agents_namespace=${var.cloud_agents_k8_namespace}' -var 'k8_cloud_agents_certificate_base64=${var.k8_cluster_certificate_base64}' ."
  }
}

resource "kubernetes_pod" "master_pod" {
  depends_on = [null_resource.packer_master]
  metadata {
    name = var.master_name
    namespace = var.master_k8_namespace
    labels = {
      app = var.master_name
    }
  }
  spec {
    container {
      name = var.master_name
      image = "${var.dockerhub_organization}/${var.dockerhub_repository}:${var.image_version}"
      port {
        container_port = 8080
      }
    }
  }
}

// data "aws_ami" "ubuntu_with_docker" {
//   owners = ["679593333241"] // aws-marketplace/SupportedImages
//   most_recent = true
//   filter {
//     name = "name"
//     values = ["**SupportedImages Docker on Ubuntu 18 docker-ce**"]
//   }
// }
//
// resource "aws_instance" "jenkins_master_instance" {
//   depends_on = [null_resource.packer, kubernetes_role_binding.jenkins_admin_role_binding]
//   ami           = data.aws_ami.ubuntu_with_docker.id
//   instance_type = "t2.micro"
//   vpc_security_group_ids = [
//     aws_security_group.allow_ingress_ssh_sg.id,
//     aws_security_group.allow_ingress_jenkins_jnlp.id,
//     aws_security_group.allow_ingress_jenkins_ui.id,
//     aws_security_group.allow_ingress_jenkins_ui_https.id,
//     aws_security_group.allow_egress_all.id
//   ]
//   subnet_id                   = aws_subnet.private_subnet.id
//   key_name                    = aws_key_pair.jenkins_aws_key_pair.key_name
//   tags = {
//     Name = "jenkins-master-instance"
//   }
//   associate_public_ip_address = true
//   // provisioner "remote-exec" {
//   //   inline = [
//   //     "docker pull ${var.dockerhub_organization}/${var.dockerhub_repository}:${var.image_version}"
//   //     "0.1"
//   //   ]
//   // }
// }