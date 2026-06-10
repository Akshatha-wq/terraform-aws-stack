variable "aws_region" {
  description = "AWS region for provider configuration."
  type        = string
  default     = "us-west-2"
}

variable "db_password" {
  description = "Master password for the RDS database."
  type        = string
  sensitive   = true
}
