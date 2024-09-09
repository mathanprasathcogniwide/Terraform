
module "vm_nginx" {
  source = "../../ec2_module"
  ami_id        = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = element(data.terraform_remote_state.vpc.outputs.public_subnet_ids, 0)  
  tags = {
    Name = "vm_nginx"
  }
  associate_public_ip_address = true
  key_name = "terraform_key"
  vpc_security_ids = [aws_security_group.nginx.id]
  user_data = file("nginx-install.sh")

  enable_file_provisioner      = true
  file_provisioner_source      = "private-key/terraform_key.pem"
  file_provisioner_destination = "/home/ec2-user/terraform_key.pem"
  private_key_path             = "private-key/terraform_key.pem"

}

  









