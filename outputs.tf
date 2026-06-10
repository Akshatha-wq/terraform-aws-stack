# VPC
output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = module.vpc.internet_gateway_id
}

# IAM
output "eks_role_arn" {
  description = "ARN of the IAM role for the EKS cluster."
  value       = module.iam.eks_role_arn
}

output "node_role_arn" {
  description = "ARN of the IAM role for EKS worker nodes."
  value       = module.iam.node_role_arn
}

# EKS
output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint URL for the EKS cluster API server."
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded certificate authority data for the EKS cluster."
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "cluster_version" {
  description = "Kubernetes version of the EKS cluster."
  value       = module.eks.cluster_version
}

output "node_group_status" {
  description = "Status of the EKS node group."
  value       = module.eks.node_group_status
}

# RDS
output "db_endpoint" {
  description = "Connection endpoint for the RDS instance."
  value       = module.rds.db_endpoint
}

output "db_name" {
  description = "Name of the default database."
  value       = module.rds.db_name
}

output "rds_sg_id" {
  description = "ID of the RDS security group."
  value       = module.rds.rds_sg_id
}
