resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name                 = "mydb"
  username             = "user"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = "${aws_db_subnet_group.db_subnet.name}"
  vpc_security_group_ids =[aws_security_group.sg_terraform_rds.id]
  tags = {
    "Name" = "terraform-db"
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name="db-r"
  subnet_ids = aws_subnet.dev_subnet_private[*].id

  tags = {
    Name = "My DB subnet group"
  }
}