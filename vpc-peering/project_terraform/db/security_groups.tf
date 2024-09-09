resource "aws_security_group" "rds_postgres_sg" {
  name        = "rds-postgres-sg"
  description = "Security group for PostgreSQL RDS instance"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.vpc_id}"  # Replace with your VPC ID

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.ec2.outputs.ec2_private_ip}/32"]  # Replace with the private IP of vm_app_1 or other IP ranges
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-postgres-sg"
  }
}


