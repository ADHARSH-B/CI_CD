locals {
  ports = ["80"]
}
resource "aws_security_group" "sg-terraform" {
  vpc_id = var.vpc__id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  dynamic "ingress" {
    for_each = local.ports
    iterator = ports
    content {
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
      cidr_blocks = [var.my_ip]
    }
  }

  tags = {
    Name = "sg-terraform"
  }
}