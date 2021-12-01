file 1
-------------------------------------------------
  provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}

resource "aws_instance" "webglobal" {
  ami           = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"
  security_groups=[aws_security_group.global.name]
}
resource "aws_security_group" "global" {
  name        = "Allow httpssh"

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
  }

  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
-------------------------------------------------------
  file 2
++++++++++++++++++++++++++++++++++++++++++++++++++++++
  resource "aws_vpc" "global_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames= "true"
}
