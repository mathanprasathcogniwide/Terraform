resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags          = var.tags
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = var.vpc_security_ids
  user_data = length(var.user_data) > 0 ? var.user_data : null

}

  resource "null_resource" "file_provisioner" {
  count = var.enable_file_provisioner ? 1 : 0

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = aws_instance.my_ec2.public_ip
  }

  provisioner "file" {
    source      = var.file_provisioner_source
    destination = var.file_provisioner_destination
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'File provisioned successfully!'"
    ]
  }

  depends_on = [aws_instance.my_ec2]
}
