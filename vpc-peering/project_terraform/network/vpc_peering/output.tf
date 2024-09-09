output "vpc_peering_connection_id" {
  description = "The ID of the VPC Peering Connection"
  value       = module.vpc_peering.vpc_peering_connection_id
}

output "network_a_vpc_id" {
  description = "The ID of VPC in network_a"
  value       = data.terraform_remote_state.network_a.outputs.vpc_id
}

output "network_b_vpc_id" {
  description = "The ID of VPC in network_b"
  value       = data.terraform_remote_state.network_b.outputs.vpc_id
}