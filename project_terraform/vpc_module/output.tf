output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_common.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc_common.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of all public subnets"
  value = [
    for subnet in aws_subnet.subnet : subnet.id
    if subnet.map_public_ip_on_launch
  ]
}

output "private_subnet_ids" {
  description = "IDs of all private subnets"
  value = [
    for subnet in aws_subnet.subnet : subnet.id
    if !subnet.map_public_ip_on_launch
  ]
}



output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.public_igw[0].id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway[0].id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table[0].id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table[0].id
}

output "public_route_table_association_ids" {
  description = "IDs of the associations between public route tables and public subnets"
  value = [
    for assoc in aws_route_table_association.public_association : assoc.id
  ]
}

output "private_route_table_association_ids" {
  description = "IDs of the associations between private route tables and private subnets"
  value = [
    for assoc in aws_route_table_association.private_association : assoc.id
  ]
}
