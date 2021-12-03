provider "aws" {
  region  = "ap-south-1"
  access_key  = ""
  secret_key  = ""
}

resource "aws_launch_template" "auto_scale" {
  name_prefix = "auto_scale"
  image_id    = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1b"]
  desired_capacity = 1
  max_size  = 4
  min_size  = 1

  launch_template {
    id  = aws_launch_template.auto_scale.id
    version  = "$Latest"
  }
}
