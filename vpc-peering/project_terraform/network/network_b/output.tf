output "vpc_id" {
  value = module.network_b.vpc_id
}

output "vpc_cidr_block" {
  value = module.network_b.vpc_cidr_block
}

output "public_subnet_ids" {
  value = module.network_b.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network_b.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.network_b.internet_gateway_id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.network_b.nat_gateway_id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.network_b.public_route_table_id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.network_b.private_route_table_id
}

output "public_route_table_association_ids" {
  description = "IDs of the associations between public route tables and public subnets"
  value = module.network_b.public_route_table_association_ids
}

output "private_route_table_association_ids" {
  description = "IDs of the associations between private route tables and private subnets"
  value = module.network_b.private_route_table_association_ids
}




