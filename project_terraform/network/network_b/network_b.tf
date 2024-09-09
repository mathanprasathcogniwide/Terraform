module "network_b" {
  source = "../../vpc_module"
  
  vpc_cidr_block = "10.1.0.0/16"  

  subnets = {
    subnet_bastion = {
      cidr_block = "10.1.1.0/24"
      az         = "us-east-1a"
      type       = "public"
    }
    subnet_c = {
      cidr_block = "10.1.2.0/24"
      az         = "us-east-1a"
      type       = "private"
    }
    subnet_d = {
      cidr_block = "10.1.3.0/24"
      az         = "us-east-1a"
      type       = "private"
    }
    subnet_e = {
      cidr_block = "10.1.4.0/24"
      az         = "us-east-1b"
      type       = "private"
    }
  }

  tags = {
    Name = "network_b"
  }
  network_name = "network_b"
  create_igw = true
  create_nat_gateway = true
  nat_gateway_subnet_name = "subnet_bastion"  
  create_public_route = true
  create_private_route = true
  associate_public_subnets = true
  associate_private_subnets = true
  create_nat_eip = true
}
