data "aws_subnets" "public" {
  filter {
   name = "vpc-id"
  values = [module.vpc.vpc_id]
  
  }
  tags = {
     environment="training/adharsh"
    type="public"
  }
}
data "aws_subnets" "private" {
  filter {
   name = "vpc-id"
   values = [module.vpc.vpc_id]
  }
  tags = {
    environment="training/adharsh"
    type="private"
  }
}

data "aws_vpc" "vpc" {
  id=module.vpc.vpc_id
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}