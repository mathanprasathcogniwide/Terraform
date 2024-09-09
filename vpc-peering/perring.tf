resource "aws_vpc_peering_connection" "vpc_peering" {
  tags = {
    Name = "vpc-peering"
  }
  vpc_id = aws_vpc.network_a.id
  peer_vpc_id = aws_vpc.network_b.id
  auto_accept = true
}

resource "aws_route" "network_a_connection" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = aws_vpc.network_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "network_b_connection"{
route_table_id = aws_route_table.network_b_public_route_table.id
destination_cidr_block = aws_vpc.network_a.cidr_block
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
