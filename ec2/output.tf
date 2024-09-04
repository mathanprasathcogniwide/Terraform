output "ec2_id" {
  value = module.my_ec2.ec2_id
}

output "ec2_public_ip" {
  value = module.my_ec2.public_ip
}

output "ec2_private_ip" {
  value = module.my_ec2.private_ip
}

output "ec2_instance_type" {
  value = module.my_ec2.instance_type
}
