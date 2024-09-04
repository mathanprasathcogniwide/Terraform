
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
  vpc_id = aws_vpc.vpc_common.id
  tags   = var.tags
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_common.id
  tags   = var.tags
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_igw.id
}

resource "aws_route_table_association" "public_association" {
  for_each = {
    for k, v in var.subnets : k => v
    if v.type == "public"
  }
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.public_route_table.id
}
