
resource "aws_lb" "test" {
  name               = "lb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.leumi-public-subnet.id]

  tags = {
    Environment = "leumi"
  }
}

# Create an Elastic IP address
resource "aws_eip" "apache_eip" {
  vpc      = true
  instance = aws_instance.simpale-web.id

  tags = {
    Environment = "leumi"
  }
}

resource "aws_lb_target_group" "apache-tg" {
  name        = "leumi-tg"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.leumi-vpc.id
}

# resource "aws_lb_target_group_attachment" "attach-lb" {
#   target_group_arn = aws_lb_target_group.apache-tg.arn
#   target_id        = aws_instance.simpale-web.id
#   port             = 80
# }

# Register instance as target with the target group
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.apache-tg.arn
  target_id        = aws_instance.simpale-web.id
  port             = 80
}
