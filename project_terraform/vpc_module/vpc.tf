resource "aws_vpc" "vpc_common" {
  cidr_block = var.vpc_cidr_block
  tags       = var.tags
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.vpc_common.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.type == "public" ? true : false

  tags = merge(
    var.tags,
    {
      "Name" = "${var.tags["Name"]}-${each.key}"
    }
  )
}


resource "aws_internet_gateway" "public_igw" {
  count = var.create_igw ? 1 : 0
  vpc_id = aws_vpc.vpc_common.id
  tags   = merge(
    var.tags,
    {
      Name = "${var.network_name}_igw"
    }
  )
}

resource "aws_route_table" "public_route_table" {
  count  = var.create_public_route_table ? 1 : 0
  vpc_id = aws_vpc.vpc_common.id
  tags   = merge(
    var.tags,
    {
      Name = "${var.network_name}_public"
    }
  )
}

resource "aws_route" "public_route" {
  count                  = var.create_public_route ? 1 : 0
  route_table_id         = aws_route_table.public_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_igw[0].id
}

resource "aws_route_table_association" "public_association" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.type == "public"
  }

  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.public_route_table[0].id
}

resource "aws_eip" "nat_eip" {
  count = var.create_nat_eip ? 1 : 0
  tags  = var.tags
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.subnet[var.nat_gateway_subnet_name].id
  tags   = merge(
    var.tags,
    {
      Name = "${var.network_name}_nat"
    }
  )
}

resource "aws_route_table" "private_route_table" {
  count  = var.create_private_route_table ? 1 : 0
  vpc_id = aws_vpc.vpc_common.id
  tags   = merge(
    var.tags,
    {
      Name = "${var.network_name}_private"
    }
  )
}

resource "aws_route" "private_route" {
  count                  = var.create_private_route ? 1 : 0
  route_table_id         = aws_route_table.private_route_table[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway[0].id
}

resource "aws_route_table_association" "private_association" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.type == "private"
  }

  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.private_route_table[0].id
}
