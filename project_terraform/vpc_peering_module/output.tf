output "vpc_peering_connection_id" {
  description = "The ID of the VPC Peering Connection"
  value       = aws_vpc_peering_connection.this.id
}

output "vpc_a_id" {
  description = "The ID of the first VPC in the peering connection"
  value       = var.vpc_id
}

output "vpc_b_id" {
  description = "The ID of the second VPC in the peering connection"
  value       = var.peer_vpc_id
}
