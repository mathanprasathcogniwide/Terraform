
module "my_ec2" {
  source        = "../ec2_module"
  ami_id        = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.vpc.outputs.public_subnet
  tags = {
    Name = "web_app"
  }
}




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


