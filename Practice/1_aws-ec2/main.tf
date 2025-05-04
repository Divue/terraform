# Specify the required provider and its version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"           # Use the official AWS provider
      version = "5.94.1"                  # Specific version of the provider
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.region                     # AWS region is passed as a variable
}

# Create an EC2 instance
resource "aws_instance" "myserver" {
  ami           = "ami-00a929b66ed6e0de6" # Amazon Machine Image (Ubuntu in this case)
  instance_type = "t2.micro"              # Instance type (free tier eligible)

  tags = {
    Name = "SampleSERVER"                  # Name tag for the instance
  }
}
