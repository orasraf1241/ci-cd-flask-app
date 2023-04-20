

# Launch an EC2 instance in the public subnet with the Security Group and Elastic IP address
resource "aws_instance" "simpale-web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  tags = {
    Name = "simpale-web"
    Environment = "leumi"
  }
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  subnet_id              = aws_subnet.leumi-public-subnet.id



  # Install Apache on the instance
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd.service
              systemctl enable httpd.service
              EOF
}


data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
