resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev_public_crt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"                     //associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.dev_igw.id //CRT uses this IGW to reach internet
  }

  tags = {
    Name = "dev-public-crt"
  }
}
resource "aws_route_table" "dev_private_crt" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "dev_private_crt"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.subnet_cidrs_public)

  subnet_id      = element(aws_subnet.dev_subnet_public.*.id, count.index)
  route_table_id = aws_route_table.dev_public_crt.id
}

resource "aws_route_table_association" "private" {
  count = length(var.subnet_cidrs_public)

  subnet_id      = element(aws_subnet.dev_subnet_private.*.id, count.index)
  route_table_id = aws_route_table.dev_private_crt.id
}


