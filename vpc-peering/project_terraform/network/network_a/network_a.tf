module "network_a" {
  source = "../../vpc_module"
  
  vpc_cidr_block = "10.0.0.0/16"  

  subnets = {
    subnet_a = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      type       = "public"
    }
    subnet_b = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1a"
      type       = "private"
    }
  }

  tags = {
    Name = "network_a"
  }
  network_name = "network_a"
  create_igw = true
  create_nat_gateway = true
  nat_gateway_subnet_name = "subnet_a"  
  create_public_route = true
  create_private_route = true
  associate_public_subnets = true
  associate_private_subnets = true
  create_nat_eip = true
}