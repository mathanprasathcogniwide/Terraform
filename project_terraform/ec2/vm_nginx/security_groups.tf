resource "aws_security_group" "nginx" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  name="nginx"
  tags = {
    Name="nginx"
  }
  ingress{
        description = "Allow ssh connection"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow http"
    from_port = 80
    to_port = 80
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