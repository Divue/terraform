resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  associate_public_ip_address = false

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "MyUbuntuInstance"
  }
}
