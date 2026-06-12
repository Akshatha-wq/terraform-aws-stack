variable "env" {
  description = "Environment name used for resource naming and tagging."
  type        = string
}

variable "eks_role_arn" {
  description = "ARN of the IAM role for the EKS cluster."
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "node_role_arn" {
  description = "ARN of the IAM role for the EKS node group."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the EKS node group."
  type        = string
}

variable "desired_nodes" {
  description = "Desired number of nodes in the EKS node group."
  type        = number
}

variable "max_nodes" {
  description = "Maximum number of nodes in the EKS node group."
  type        = number
}
