output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_common.id
}

output "public_subnet" {
  description = "The ID of the public subnet"
  value       = aws_subnet.subnet["public_subnet"].id
}

output "private_subnet_a" {
  description = "The ID of the private subnet"
  value       = aws_subnet.subnet["private_subnet_a"].id
}

output "private_subnet_b" {
  description = "The ID of the private subnet"
  value       = aws_subnet.subnet["private_subnet_b"].id
}



output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.public_igw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}



