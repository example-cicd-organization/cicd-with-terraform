resource "null_resource" "packer" {
  triggers = {
    packer_file = "${sha1(file("${path.module}/packer/jenkins.pkr.hcl"))}"
  }
  provisioner "local-exec" {
    working_dir = "${path.module}/packer"
    command = "packer init ."
  }
  provisioner "local-exec" {
    working_dir = "${path.module}/packer"
    command = "packer build -var 'dockerhub_username=${var.dockerhub_username}' -var 'dockerhub_password=${var.dockerhub_password}' -var 'dockerhub_organization=${var.dockerhub_organization}' -var 'dockerhub_repository=${var.dockerhub_repository}' -var 'version=${var.image_version}' ."
  }
}

resource "aws_ami" "ubuntu_with_docker" {
  name = "ubuntu-with-docker"
  most_recent = true
  filter {
    name = 'name'
    values = ["ubuntu/images/"]
  }

}

resource "aws_instance" "jenkins_master_instance" {
  depends_on = [null_resource.packer]
  ami           = data.aws_ami.jenkins_aws_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh_sg.id
  ]
  subnet_id                   = aws_subnet.private_subnet.id
  key_name                    = aws_key_pair.jenkins_aws_key_pair.key_name
  tags = {
    Name = "jenkins-master-instance"
  }
  provisioner "remote-exec" {
    inline = [
      ""
    ]
  }
}