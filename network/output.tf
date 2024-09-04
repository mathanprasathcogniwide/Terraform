output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnet
}

output "private_subnet_a" {
  value = module.vpc.private_subnet_a
}

output "private_subnet_b" {
  value = module.vpc.private_subnet_b
}