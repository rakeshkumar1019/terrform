provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}
resource "aws_instance" "dish" {
  ami           = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"

  tags = {
    Name = "Rakesh_HelloWorld"
  }
}

resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-test-bucket1019101911"
  acl    = "private"

  tags = {
    Name        = "My1 bucket"
    Environment = "Dev1-Env"
  }
}

resource "aws_vpc" "dev" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "20.0.1.0/24"

  tags = {
    Name = "dev-subnet"
  }
}

resource "aws_db_instance" "projectdb" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "myterradb"
  username             = "dish"
  password             = "redhat123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}


