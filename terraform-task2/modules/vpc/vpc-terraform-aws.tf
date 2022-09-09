resource "aws_vpc" "dev_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"

  tags = {
    Name = "dev-vpc-new"
  }
}

