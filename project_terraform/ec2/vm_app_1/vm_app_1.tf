
module "vm_app_1" {
  source = "../../ec2_module"
  ami_id        = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, 0)  
  tags = {
    Name = "vm_app_1"
  }
  associate_public_ip_address = false
  key_name = "terraform_key"
  vpc_security_ids = [aws_security_group.vm_app_1_ssh.id]
   enable_file_provisioner      = false
}





//source        = "github.com/mathanprasathcogniwide/Terraform//ec2_module"


