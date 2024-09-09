output "ec2_id" {
  value = module.vm_nginx.ec2_id
}

output "ec2_public_ip" {
  value = module.vm_nginx.public_ip
}

output "ec2_private_ip" {
  value = module.vm_nginx.private_ip
}

output "ec2_instance_type" {
  value = module.vm_nginx.instance_type
}
