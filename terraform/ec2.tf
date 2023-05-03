# Create the EC2 instance
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id

  key_name      = var.key_name # name of the key pair to use
  associate_public_ip_address = true # allocate an Elastic IP and associate it with the instance

  # Add tags to the instance
  tags = {
    Name = "my-instance"
  }
}



