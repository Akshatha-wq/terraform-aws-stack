module "vpc" {
  source = "./modules/vpc"

  env                  = terraform.workspace
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  azs                  = ["us-west-2a", "us-west-2b"]
}

module "iam" {
  source = "./modules/iam"

  env = terraform.workspace
}

module "eks" {
  source = "./modules/eks"

  env                = terraform.workspace
  public_subnet_ids = module.vpc.public_subnet_ids
  eks_role_arn       = module.iam.eks_role_arn
  node_role_arn      = module.iam.node_role_arn
  k8s_version        = "1.32"
  instance_type      = "t3.medium"
  desired_nodes      = 2
  max_nodes          = 4
}

module "rds" {
  source = "./modules/rds"

  env                = terraform.workspace
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_name            = "appdb"
  db_password        = var.db_password
}
