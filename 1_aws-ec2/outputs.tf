# Output the public IP address of the EC2 instance after deployment
output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip
}
