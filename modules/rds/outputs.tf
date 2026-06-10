output "db_endpoint" {
  description = "Connection endpoint for the RDS instance."
  value       = aws_db_instance.main.endpoint
}

output "db_name" {
  description = "Name of the default database."
  value       = aws_db_instance.main.db_name
}

output "rds_sg_id" {
  description = "ID of the RDS security group."
  value       = aws_security_group.rds.id
}
