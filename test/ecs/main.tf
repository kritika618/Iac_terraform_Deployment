provider "aws" {
  region = var.aws_region
}

resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.project_name}-task"
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::273354669111:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = "app-container"
      image     = "273354669111.dkr.ecr.ap-south-1.amazonaws.com/sample_app"
      essential = true
      portMappings = [{
        containerPort = var.container_port
        protocol      = "tcp"
      }]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-0a433e5614138a125", "subnet-0cc71f61342a9a205"]
    security_groups  = ["sg-0a425b63089c65cd2"]
    assign_public_ip = true
  }
}
