module "vpc" {
  source = "../modules/vpc"
}
module "ec2" {
  source = "../modules/ec2"
  subnet_ids=data.aws_subnets.public.ids
  vpc__id = data.aws_vpc.vpc.id
  ec2_type  = "t2.micro"
  ec2_ami   = "${data.aws_ami.ubuntu.id}"
  ec2_count=2
  rds_user     = var.RDS_USER
  rds_password = var.RDS_PASSWORD
  rds_endpoint = module.rds.rds_endpoint
}

module "rds" {
  source = "../modules/rds"
  subnet_ids=data.aws_subnets.private.ids
  vpc__id = data.aws_vpc.vpc.id
  rds_user     = var.RDS_USER
  rds_password = var.RDS_PASSWORD
  ec2_security_id=module.ec2.ec2_sg_id
}