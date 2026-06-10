variable "env" {
  description = "Environment name used for resource naming and tagging."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the RDS instance."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "eks_node_cidr" {
  description = "CIDR block allowed to connect to the RDS instance."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the default database to create."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the RDS instance."
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Master password for the RDS instance."
  type        = string
  sensitive   = true
}
