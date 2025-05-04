terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a custom VPC with a /16 CIDR block
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

# Create a private subnet inside the VPC
resource "aws_subnet" "Private-subnet" {
  cidr_block = "10.0.1.0/24"     # Private subnet IP range
  vpc_id     = aws_vpc.my-vpc.id # Associate with the VPC
  tags = {
    Name = "private-subnet"
  }
}

# Create a public subnet inside the VPC
resource "aws_subnet" "public-subnet" {
  cidr_block              = "10.0.2.0/24"     # Public subnet IP range
  vpc_id                  = aws_vpc.my-vpc.id # Associate with the VPC
  map_public_ip_on_launch = true              # Assign public IPs to instances launched in this subnet
  tags = {
    Name = "public-subnet"
  }
}

# Create an Internet Gateway to allow internet access
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Create a route table with a route to the Internet Gateway
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"                    # Route all outbound traffic
    gateway_id = aws_internet_gateway.my-igw.id # Route through IGW
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id      = aws_subnet.public-subnet.id
}

# Launch an EC2 instance in the public subnet
resource "aws_instance" "myserver" {
  ami           = "ami-00a929b66ed6e0de6"     # Amazon Linux 2 AMI (example)
  instance_type = "t2.micro"                  # Free-tier eligible
  subnet_id     = aws_subnet.public-subnet.id # Launch in public subnet

  tags = {
    Name = "SampleSERVER"
  }
}
