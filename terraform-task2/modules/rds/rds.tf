resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "mydb"
  username               = var.rds_user
  password               = var.rds_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.sg_terraform_rds.id]
  tags = {
    "Name" = "terraform-db"
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_r"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}