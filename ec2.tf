provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}
resource "aws_instance" "web" {
  ami           = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"

  tags = {
    Name = "Rakesh_HelloWorld"
  }
}



executing steps:
terraform init
terraform plan
terraform apply
