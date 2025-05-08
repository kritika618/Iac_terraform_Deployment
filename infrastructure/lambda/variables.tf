variable "hello-lambda" {
  description = "Name of the Lambda function"
  type        = string
}

variable "image_uri" {
  description = "ECR image URI for the Lambda"
  type        = string
}
