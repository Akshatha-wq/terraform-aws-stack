variable "env" {
  description = "Environment name used for resource naming and tagging."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones for subnet placement. Must align with public and private subnet CIDR lists."
  type        = list(string)
}
