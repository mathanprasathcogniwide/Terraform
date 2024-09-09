resource "aws_db_subnet_group" "subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
  tags = {
    Name = "My_DB_Subnet_Group"
  }
}


resource "aws_db_instance" "my_db" {
  db_name              = var.db_name
  engine               = var.engine
  allocated_storage    = var.allocated_storage
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
  tags                 = var.tags
  skip_final_snapshot  = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_ids
}
