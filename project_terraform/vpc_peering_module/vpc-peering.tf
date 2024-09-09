resource "aws_vpc_peering_connection" "this" {
  vpc_id        = var.vpc_id
  peer_vpc_id    = var.peer_vpc_id
  auto_accept    = var.auto_accept

  tags = {
    Name = "vpc-peering-${var.vpc_id}-${var.peer_vpc_id}"
  }
}

resource "aws_route" "peer_route_network_a" {
  count                  = var.auto_accept ? 1 : 0
  route_table_id         = var.route_table_id_network_a
  destination_cidr_block = var.peer_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "peer_route_network_b" {
  count                  = var.auto_accept ? 1 : 0
  route_table_id         = var.route_table_id_network_b
  destination_cidr_block = var.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}
