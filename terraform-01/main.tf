terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2-terraform" {
  ami           = "ami-0a7df26aa9de35392"
  instance_type = "t2.micro"
  key_name      = "virtualizacao"

  tags = {
    Name          = "Ec2 Terraform"
    virtualizacao = "Terraform"
  }
  vpc_security_group_ids = ["sg-0a1930da4c03e51e3"]
}


resource "aws_security_group" "acesso-remoto" {
  name        = "Remote-Acess"
  description = "Allow remote acess"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "acesso remoto"
  }

}
