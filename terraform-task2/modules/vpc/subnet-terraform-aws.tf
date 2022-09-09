resource "aws_subnet" "dev_subnet_public" {
  count                   = length(var.subnet_cidrs_public)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_cidrs_public[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = {
    "Name"        = "dev-subnet-public${count.index}"
    "environment" = "training/adharsh"
    "type"        = "public"
  }
}

resource "aws_subnet" "dev_subnet_private" {
  count             = length(var.subnet_cidrs_private)
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.subnet_cidrs_private[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    "Name"        = "dev-subnet-private${count.index}"
    "environment" = "training/adharsh"
    "type"        = "private"
  }
}
