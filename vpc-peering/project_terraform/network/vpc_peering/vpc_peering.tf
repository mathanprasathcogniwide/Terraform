module "vpc_peering" {
  source = "../../vpc_peering_module"

  vpc_id                   = data.terraform_remote_state.network_a.outputs.vpc_id
  peer_vpc_id              = data.terraform_remote_state.network_b.outputs.vpc_id
  auto_accept              = true
  route_table_id_network_a = data.terraform_remote_state.network_a.outputs.public_route_table_id
  route_table_id_network_b = data.terraform_remote_state.network_b.outputs.public_route_table_id
  peer_cidr_block          = data.terraform_remote_state.network_b.outputs.vpc_cidr_block
  vpc_cidr_block           = data.terraform_remote_state.network_a.outputs.vpc_cidr_block
}


