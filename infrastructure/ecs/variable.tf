variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "terraform-ecs-cluster"

}

variable "project_name" {
  default = "sample-app"
}

variable "cpu" {
  default = 256
}

variable "memory" {
  default = 512
}

variable "container_port" {
  default = 80
}
