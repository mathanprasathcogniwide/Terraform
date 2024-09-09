resource "aws_instance" "ec2_network_a" {
  subnet_id = aws_subnet.network_a_public_subnet.id
  ami = "ami-0182f373e66f89c85"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ssh_network_a.id]
  key_name = "terraform_home_key"
  instance_type = "t2.micro"
  tags ={
    Name = "ec2-network_a"
  }
}

resource "aws_instance" "ec2_network_b" {
  subnet_id = aws_subnet.network_b_public_subnet.id
  ami = "ami-0182f373e66f89c85"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ssh_network_b.id]
  key_name = "terraform_home_key"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-network_b"
  }
}
