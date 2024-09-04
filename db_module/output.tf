output "db_name" {
  value = aws_db_instance.my_db.db_name
}

output "db_endpoint" {
  value = aws_db_instance.my_db.endpoint
}

output "db_address" {
  value = aws_db_instance.my_db.address
}