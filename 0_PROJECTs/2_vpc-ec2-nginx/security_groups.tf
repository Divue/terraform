# Create a Security Group for the Nginx server
resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my-vpc.id  # Associate the security group with your custom VPC

  # Inbound rule: allow HTTP traffic from anywhere (port 80)
  ingress {
    from_port   = 80              # Starting port of the range (HTTP)
    to_port     = 80              # Ending port of the range (HTTP)
    protocol    = "tcp"           # Use TCP protocol
    cidr_blocks = ["0.0.0.0/0"]   # Allow traffic from all IPv4 addresses (open to internet)
  }

  # Outbound rule: allow all traffic to any destination
  egress {
    from_port   = 0               # Start of port range (0 means all)
    to_port     = 0               # End of port range (0 means all)
    protocol    = "-1"            # -1 means all protocols (TCP, UDP, etc.)
    cidr_blocks = ["0.0.0.0/0"]   # Allow outbound traffic to anywhere
  }

  tags = {
    Name = "nginx-sg"             # Tag for identifying the security group
  }
}
