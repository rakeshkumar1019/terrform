file 1
_________________________________________________________
provider "aws"{
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}

provider "aws"{
   region = var.aws_region
   profile = "MyAWS"
   alias = "useast1"
}
resource "aws_instance" "dishnet" {
  ami           = lookup(var.region_ami,var.aws_region)
  instance_type = "t2.micro"

  tags = {
    Name = "Rakesh_HelloWorld"
  }
}
+++++++++++++++++++++++++++++++++++++++++++++++++++++
  file 2
________________________________________________________
variable "aws_region" {  
 default     = "ap-south-1"
}
variable "key_name" {  
 default     = "youtube"
}
variable "ec2_types" {  
 default     = "t2.micro"
}
variable "region_ami" {
  type = map
  default ={
    ap-south-1 = "ami-052cef05d01020f1d"
    us-east-1 ="ami-061ac2e015473fbe2"  
}

}

