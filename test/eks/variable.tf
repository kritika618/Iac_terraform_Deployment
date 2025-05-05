variable "region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "terraform-eks-cluster"
}

variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
