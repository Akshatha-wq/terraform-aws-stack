resource "aws_eks_cluster" "main" {
  name     = "${var.env}-eks-cluster"
  role_arn = var.eks_role_arn
  version  = var.k8s_version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = { Environment = var.env }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.env}-nodes"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = [var.instance_type]

  scaling_config {
    desired_size = var.desired_nodes
    min_size     = 1
    max_size     = var.max_nodes
  }
}
