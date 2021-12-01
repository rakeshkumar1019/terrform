provider "aws" {
   region = "ap-south-1"
   access_key = "AKIA3OYOHRU5GRDXDUFD"
   secret_key = "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"
}
resource "aws_instance" "web" {
  ami           = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"

  tags = {
    Name = "Rakesh_HelloWorld"
  }
}
