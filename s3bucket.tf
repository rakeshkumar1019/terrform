provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket1019101911"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
