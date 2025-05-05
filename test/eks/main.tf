provider "aws" {
  region = "ap-south-1"  # Directly hardcoded if desired
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "terraform-eks-cluster"
  cluster_version = "1.29"
  subnets         = ["subnet-0a433e5614138a125", "subnet-0cc71f61342a9a205"]
  vpc_id          = "vpc-0a19349c1563bf053"

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}
