output "eks_role_arn" {
  description = "ARN of the IAM role for the EKS cluster."
  value       = aws_iam_role.eks_cluster.arn
}

output "node_role_arn" {
  description = "ARN of the IAM role for EKS worker nodes."
  value       = aws_iam_role.eks_node.arn
}
