# Output the public IP address of the EC2 instance
output "instance_public_id" {
  description = "The public IP address of EC2 instance"
  value       = aws_instance.nginxserver.public_ip  # Fetches the EC2 public IP
}

# Output the complete URL to access the Nginx server via browser
output "instance_url" {
  description = "The URL to access the Nginx server"
  value       = "http://${aws_instance.nginxserver.public_ip}"  # Formats the IP as a URL
}
