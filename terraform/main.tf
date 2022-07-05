terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "project_ubuntu" {
  ami           = lookup(var.ami, "ubuntu")
  instance_type = var.ec2_type
  key_name = var.key_name
  subnet_id = aws_subnet.project_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.acesso_project.id]
  tags = {
    Name = "Project"
  }
  depends_on = [aws_vpc.project_vpc]
}

resource "aws_instance" "ansible" {
  ami           = lookup(var.ami, "ubuntu")
  instance_type = var.ec2_type
  key_name = var.key_name
  subnet_id = aws_subnet.project_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.acesso_project.id]
  user_data = <<-EOF
                 #!/bin/bash
                 sudo apt-get update && \
                 sudo apt-get install -y software-properties-common && \
                 sudo apt-add-repository --yes --update ppa:ansible/ansible && \
                 sudo apt-get install -y ansible
                 EOF
  tags = {
    Name = "Ansible"
  }
  depends_on = [aws_vpc.project_vpc]
}

resource "aws_instance" "project_windows" {
  ami           = lookup(var.ami, "windows")
  instance_type = var.ec2_type
  key_name = var.key_name
  subnet_id = aws_subnet.project_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.project_win.id]
  
  tags = {
    Name = "Project_Windows"
  }
  depends_on = [aws_vpc.project_vpc]
}

