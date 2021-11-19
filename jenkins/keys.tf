// resource "tls_private_key" "jenkins_key_pair" {
//   algorithm = "RSA"
//   rsa_bits  = 4096
// }
//
// resource "local_file" "jenkins_private_key" {
//   content         = tls_private_key.jenkins_key_pair.private_key_pem
//   filename        = "jenkins_private_key.pem"
//   file_permission = "0700"
// }
//
// resource "aws_key_pair" "jenkins_aws_key_pair" {
//   key_name   = var.aws_key_pair_name
//   public_key = tls_private_key.jenkins_key_pair.public_key_openssh
// }
//