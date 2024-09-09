module "project_db" {
  source              = "../db_module"
  //source              = "github.com/mathanprasathcogniwide/Terraform//db_module"
  db_name             = "project_db"
  engine              = "postgres"
  allocated_storage   = 20
  engine_version      = "16.2"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = "123456789"
  publicly_accessible = false
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds_postgres_sg.id]
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.private_subnet_ids[1], 
    data.terraform_remote_state.vpc.outputs.private_subnet_ids[2] 
  ]
  subnet_group_name = "my_subnet_group"
  tags = {
    Name = "My_DB_Instance"
  }
}
