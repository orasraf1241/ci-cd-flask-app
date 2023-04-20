
# Create a VPC with a public subnet
resource "aws_vpc" "leumi-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "leumi-vpc"
  }

  enable_dns_hostnames = true

}

# Define the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.leumi-vpc.id

  tags = {
    Name = "IGW"
  }
}


# Create a route table for the public subnet
resource "aws_route_table" "main_public" {
  vpc_id = aws_vpc.leumi-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route Table"
    Environment = "leumi"
  }
}

resource "aws_subnet" "leumi-public-subnet" {
  vpc_id                  = aws_vpc.leumi-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "leumi-public-subnet"
    Environment = "leumi"
  }
}


# Associate the public subnet with the public route table
resource "aws_route_table_association" "main_public" {
  subnet_id      = aws_subnet.leumi-public-subnet.id
  route_table_id = aws_route_table.main_public.id
}

# Create a Security Group for the EC2 instance
resource "aws_security_group" "example_sg" {
  name_prefix = "dmz-web"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["91.231.246.50/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dmz-web"
    Environment = "leumi"
  }

  vpc_id = aws_vpc.leumi-vpc.id
}

