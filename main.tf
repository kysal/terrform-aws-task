terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "kyle-terraform-bucket"
  
  tags = {
    Name = "Kyle Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl = "private"
}

resource "aws_instance" "app_server" {
  ami = "ami-08cd358d745620807"
  instance_type = "t3.small"

  tags = {
    Name = "Kyle-TerraformAppServerInstance"
  }
}

resource "aws_lb_target_group" "lb_group" {
  name = "kyle-lb-tg"
  vpc_id = "vpc-033261a13b736a250"

  # Unsure what this does
  port = 80
  protocol = "HTTP"
}

resource "aws_lb" "load_balancer" {
  name = "kyle-nlb-terraform"
  internal = false
  load_balancer_type = "network"
  subnets = [ 
    "subnet-0b9a0a0d81a9e9a11",
    "subnet-03fc2475c68b57df6",
    "subnet-049bc4534aa922545"
   ]
}

resource "aws_lb_target_group_attachment" "lb_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_group.arn
  target_id = aws_instance.app_server.id
  port = 80
}

# resource "aws_s3_bucket_lifecycle_configuration" "bucket_lc" {
  
# }