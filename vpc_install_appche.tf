reference https://dev.to/chefgs/create-apache-web-server-in-aws-using-terraform-1fpj
-----------------------------------------
file1 name main.tf
___________________________________________________________
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
  access_key = ""
  secret_key = ""
  region = var.region
 # shared_credentials_file = var.creds
  profile = "default"
}

# Create a VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "app-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_instance" "web" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = var.instance_type
  key_name = "Global"
  subnet_id              = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo yum update -y
  sudo yum install apache2 -y
  echo "*** Completed Installing apache2"
  EOF

  tags = {
    Name = "web_instance"
  }

  volume_tags = {
    Name = "web_instance"
  }
}
---------------------------------------------------------------------------------------------------
  file 2 varaiable.tf
------------------------------------------------------------------------------------------
  variable "region" {
default = "ap-south-1"
}
variable "instance_type" {
default = "t2.micro"
}
variable "creds" {
default = "/root/youtube/.aws/credentials"
}
variable "instance_key" {
default = "Global"
}
variable "vpc_cidr" {
default = "178.0.0.0/16"
}
variable "public_subnet_cidr" {
default = "178.0.10.0/24"
}
--------------------------------------------------------------------------
  file 3 sg.tf
___________________________________________________________________________
resource "aws_security_group" "sg" {
  name        = "allow_ssh_http"
  description = "Allow ssh http inbound traffic"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}
_____________________________________________________________________________
file4  aws.tfvars
-----------------------------------------------------------------------
region =  "ap-south-1"
instance_type = "t2.micro"
instance_key = "/root/Global.pem"
creds = "~/.aws/credentials"
vpc_cidr = "178.0.0.0/16"
public_subnet_cidr = "178.0.10.0/24"
-----------------------------------------------------------------------
  file 5 output.tf
-----------------------------------------------
  output "web_instance_ip" {
    value = aws_instance.web.public_ip
}
----------------------------------------------------------------------------------------
  
