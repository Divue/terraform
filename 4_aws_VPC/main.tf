terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#Create a VPC
resource "aws_vpc" "my-VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="my-vpc"
  }
}

#Private subnet
resource "aws_subnet" "Private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my-VPC.id
  tags = {
    Name="private-subnet"
  }
}

#Public subnet
resource "aws_subnet" "Public-subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.my-VPC.id
  map_public_ip_on_launch = true
  tags = {
    Name="public-subnet"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name= "my-igw"
    }
}

#Routing table
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-VPC.id
  
  route = {
    cidr_block="0.0.0.0/0"
    gateway_id= aws_internet_gateway.my-igw.id
  }
}

resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id = aws_subnet.public-subnet.id
}