provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-00a929b66ed6e0de6"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    tags = {
    Name = "ex2-example"
  }
}

# AWS used default VPC and subnet so we didnt give the info 
# Terraform assumes HashiCorp by default

