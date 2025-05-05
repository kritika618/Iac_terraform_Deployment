variable "region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "terraform-eks-cluster"
}

variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
  default = ["subnet-0a433e5614138a125", "subnet-0cc71f61342a9a205"]
}
