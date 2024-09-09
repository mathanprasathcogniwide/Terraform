output "ec2_id" {
  value = module.vm_app_1.ec2_id
}

output "ec2_public_ip" {
  value = module.vm_app_1.public_ip
}

output "ec2_private_ip" {
  value = module.vm_app_1.private_ip
}

output "ec2_instance_type" {
  value = module.vm_app_1.instance_type
}
