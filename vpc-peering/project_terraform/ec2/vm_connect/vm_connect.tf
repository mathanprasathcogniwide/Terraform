
module "vm_connect" {
  source = "../../ec2_module"
  ami_id        = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = element(data.terraform_remote_state.vpc.outputs.private_subnet_ids, 0)  
  tags = {
    Name = "vm_connect"
  }
  associate_public_ip_address = false
  key_name = "terraform_key"
  vpc_security_ids = [aws_security_group.vm_connect_ssh.id]
  enable_file_provisioner      = false
}





//source        = "github.com/mathanprasathcogniwide/Terraform//ec2_module"
# resource "aws_instance" "my_instance_terraform" {
#   ami           = "ami-066784287e358dad1"
#   instance_type = "t2.micro"

#   subnet_id = data.terraform_remote_state.vpc.outputs.vpc_3_public_subnet_id
#   tags = {
#     Name = "web_server"
#   }
# }

# resource "aws_instance" "my_manual_instance" {
#   ami           = "ami-066784287e358dad1"
#   instance_type = "t2.micro"
#   subnet_id = data.terraform_remote_state.vpc.outputs.vpc_3_private_subnet_id
#   tags = {
#     Name = "app_server"
#   }
# }


