# EC2 Instance for Nginx Setup
resource "aws_instance" "nginxserver" {

  # Specify the AMI (Amazon Linux 2 in this case)
  ami = "ami-00a929b66ed6e0de6"  # Replace with latest/region-specific AMI if needed

  # Use a free-tier eligible instance type
  instance_type = "t2.micro"

  # Launch the instance in the public subnet
  subnet_id = aws_subnet.public-subnet.id

  # Attach the security group that allows HTTP (port 80) access
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  # Ensure the instance gets a public IP to be accessible over the internet
  associate_public_ip_address = true

  # user_data script to install and start Nginx on boot
  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y       # Install Nginx
            sudo systemctl start nginx      # Start Nginx service
            sudo systemctl enable nginx     # Enable Nginx to start on boot (optional but recommended)
            EOF

  # Tags help with identification in the AWS console
  tags = {
    Name = "NginxServer"
  }
}
