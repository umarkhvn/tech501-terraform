resource "aws_instance" "umar_app_instance" {
  ami                    = var.ami_id
  instance_type           = var.instance_type
  associate_public_ip_address = true
  security_groups         = [aws_security_group.tech501-umar-tf-allow-port22-3000-80.name]
  key_name                = var.key_name
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "tech501-umar-tf-allow-port22-3000-80" {
  name        = var.sg_name
  description = "Allow SSH (22), HTTP (80), and custom port (3000)"

  ingress {
    from_port   = var.ssh_port_22
    to_port     = var.ssh_port_22
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  ingress {
    from_port   = var.port_3000
    to_port     = var.port_3000
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  ingress {
    from_port   = var.port_80
    to_port     = var.port_80
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_block
  }
}