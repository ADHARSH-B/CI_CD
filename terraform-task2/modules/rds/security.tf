resource "aws_security_group" "sg_terraform_rds" {
  vpc_id = var.vpc__id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "TLS from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_security_id]
    # cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_terraform_rds"
  }
}