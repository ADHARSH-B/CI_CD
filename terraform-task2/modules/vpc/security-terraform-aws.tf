locals {
  ports = ["22", "80"]
}
resource "aws_security_group" "sg-terraform" {
  vpc_id = aws_vpc.dev_vpc.id

  dynamic "ingress" {
    for_each = local.ports
    iterator = ports
    content {
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "sg-terraform"
  }
}