provider "aws" {
  region = "ap-south-1"
}

# Security group for EC2
resource "aws_security_group" "web_sg" {
  name        = "${var.name}-ec2-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-web-sg"
  }
}

# Create or import SSH key pair
resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = file(pathexpand(var.public_key_path))
}

# Launch EC2 instance(s)
resource "aws_instance" "web" {
  ami                    = "ami-0dee22c13ea7a9a67" # Ubuntu 22.04 in ap-south-1
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.main.key_name
  user_data              = var.user_data
  associate_public_ip_address = var.create_in_public_subnet

  tags = {
    Name = "${var.name}-web"
  }
}

