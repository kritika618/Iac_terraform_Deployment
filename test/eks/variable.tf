variable "region" {
  description = "AWS region"
  type        = string
  region         = "ap-south-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  cluster_name   = "terraform-eks-cluster"
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
  vpc_id         = "vpc-0a19349c1563bf053"
}

variable "private_subnets" {
  description = "List of private subnet IDs for EKS nodes"
  type        = list(string)
  private_subnets = ["subnet-0a433e5614138a125", "subnet-0cc71f61342a9a205"]
}
