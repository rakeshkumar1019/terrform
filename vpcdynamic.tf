provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}

variable "ingressrules"{
   type = list(number)
   default = [80,443]
}
variable "egressrules"{
   type= list(number)
   default = [80,443,25,3306,53,8080]
}


resource "aws_instance" "webglobal" {
  ami           = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"
  security_groups=[aws_security_group.webtraffic.name]
}
resource "aws_security_group" "webtraffic" {
  name        = "Allow HTTPS2021"

 dynamic "ingress" {
    iterator         =port
    for_each         = var.ingressrules
    content{
     cidr_blocks      = ["0.0.0.0/0"]
     from_port        = port.value
     to_port          = port.value     
     protocol         = "TCP"
    }
  }

  dynamic "egress" {
    iterator         = port
    for_each         = var.egressrules
    content{
     from_port        = port.value
     to_port          = port.value
     protocol         = "TCP"
     cidr_blocks      = ["0.0.0.0/0"]
    }
  }
}
