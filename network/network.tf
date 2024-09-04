


module "vpc" {
  source         = "../vpc_module"
  vpc_cidr_block = "10.7.0.0/16"
  subnets = {
    public_subnet = {
      cidr_block = "10.7.1.0/24"
      az         = "us-east-1a"
      type       = "public"
    }
    private_subnet_a = {
      cidr_block = "10.7.2.0/24"
      az         = "us-east-1a"
      type       = "private"
    }
    private_subnet_b = {
      cidr_block = "10.7.3.0/24"
      az         = "us-east-1b"
      type       = "private"
    }
  }
  tags = {
    Name = "VPC 1"
  }
}



