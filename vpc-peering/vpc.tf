
resource "aws_vpc" "network_a" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="network_a"
  }
}

resource "aws_subnet" "network_a_public_subnet" {
  vpc_id = aws_vpc.network_a.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name="network_a_public_subnet"
  }
}

resource "aws_internet_gateway" "network_a_igw" {
  vpc_id = aws_vpc.network_a.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.network_a.id
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.network_a_igw.id
}

resource "aws_route_table_association" "associate_network-a" {
  subnet_id = aws_subnet.network_a_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_vpc" "network_b" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name="network_b"
  }
}

resource "aws_subnet" "network_b_public_subnet" {
  cidr_block = "10.1.1.0/24"
  vpc_id = aws_vpc.network_b.id
  map_public_ip_on_launch = true
  tags = {
    Name="network_b_public_subnet"
  }
}

resource "aws_internet_gateway" "network_b_igw" {
  vpc_id = aws_vpc.network_b.id
}

resource "aws_route_table" "network_b_public_route_table" {
  vpc_id = aws_vpc.network_b.id
}

resource "aws_route" "network_b_public_route" {
  route_table_id = aws_route_table.network_b_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.network_b_igw.id
}

resource "aws_route_table_association" "network_b_route_association" {
  subnet_id = aws_subnet.network_b_public_subnet.id
  route_table_id = aws_route_table.network_b_public_route_table.id
}