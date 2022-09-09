output "ec2_subnet_public_id" {
  value = aws_subnet.dev_subnet_public[*].id
}
output "ec2_subnet_private_id" {
  value = aws_subnet.dev_subnet_private[*].id
}
output "vpc_id" {
  value = aws_vpc.dev_vpc.id
}