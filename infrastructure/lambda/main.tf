provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = "arn:aws:iam::273354669111:role/Tf_Lambda_function"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "docker_lambda" {
  function_name = "hello-docker-lambda"
  package_type  = "Image"
  image_uri     = "273354669111.dkr.ecr.ap-south-1.amazonaws.com/lambda-github:v1.0.0"
  role          = "arn:aws:iam::273354669111:role/Tf_Lambda_function"
  timeout       = 10
}
