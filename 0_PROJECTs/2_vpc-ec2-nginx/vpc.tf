# Create a custom VPC with a /16 CIDR block
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"  # Allows up to 65,536 IP addresses
  tags = {
    Name = "my-vpc"           # Tag to identify the VPC
  }
}

# Create a private subnet inside the VPC
resource "aws_subnet" "Private-subnet" {
  cidr_block = "10.0.1.0/24"       # IP range for the private subnet (256 addresses)
  vpc_id     = aws_vpc.my-vpc.id   # Associate this subnet with the custom VPC
  tags = {
    Name = "private-subnet"        # Tag for identification
  }
}

# Create a public subnet inside the VPC
resource "aws_subnet" "public-subnet" {
  cidr_block              = "10.0.2.0/24"       # IP range for the public subnet
  vpc_id                  = aws_vpc.my-vpc.id   # Associate this subnet with the VPC
  map_public_ip_on_launch = true                # Automatically assign a public IP to instances
  tags = {
    Name = "public-subnet"                      # Tag for identification
  }
}

# Create an Internet Gateway (IGW) to allow traffic in/out of the VPC
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id       # Attach the IGW to the VPC
  tags = {
    Name = "my-igw"                # Tag for identification
  }
}

# Create a route table to define internet access
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id       # Associate route table with the VPC

  route {
    cidr_block = "0.0.0.0/0"                   # Match all IP addresses (Internet)
    gateway_id = aws_internet_gateway.my-igw.id # Use IGW to route external traffic
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my-rt.id   # Attach route table to subnet
  subnet_id      = aws_subnet.public-subnet.id
}
