module "project_db" {
  source              = "../db_module"
  db_name             = "project_db"
  engine              = "postgres"
  allocated_storage   = 20
  engine_version      = "16.2"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = "123456789"
  publicly_accessible = false
  skip_final_snapshot = true
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.private_subnet_a,
    data.terraform_remote_state.vpc.outputs.private_subnet_b
  ]
  subnet_group_name = "my_subnet_group"
  tags = {
    Name = "My_DB_Instance"
  }
}
