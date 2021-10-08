/* == VPC == */
resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "jenkins-vpc"
  }
}

/* == SUBNET == */
/* Public subnet */
resource "aws_subnet" "public_subnet" {
  cidr_block              = var.public_subnet_cidr
  vpc_id                  = aws_vpc.jenkins_vpc.id
  availability_zone       = "${var.jenkins_aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}
/* Private subnet */
resource "aws_subnet" "private_subnet" {
  cidr_block              = var.private_subnet_cidr
  vpc_id                  = aws_vpc.jenkins_vpc.id
  availability_zone       = "${var.jenkins_aws_region}a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet"
  }
}

/* == SECURITY == */
resource "aws_security_group" "allow_all_outbound_sg" {
  name   = "allow-all-outbound-sg"
  vpc_id = aws_vpc.jenkins_vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_ssh_sg" {
  name        = "allow-ssh-sg"
  description = "Allow SSH traffic"
  vpc_id      = aws_vpc.jenkins_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}