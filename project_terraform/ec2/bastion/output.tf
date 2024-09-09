output "ec2_id" {
  value = module.bastion.ec2_id
}

output "ec2_public_ip" {
  value = module.bastion.public_ip
}

output "ec2_private_ip" {
  value = module.bastion.private_ip
}

output "ec2_instance_type" {
  value = module.bastion.instance_type
}
