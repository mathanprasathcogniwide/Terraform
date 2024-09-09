resource "aws_security_group" "vm_connect_ssh" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  name="vm_connect_ssh"
    tags = {
    Name="vm_connect_ssh"
  }
  ingress{
        description = "Allow ssh connection"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        description = "Allow all outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}