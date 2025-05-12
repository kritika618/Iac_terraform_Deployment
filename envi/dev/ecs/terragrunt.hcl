terraform {
  source = "git::https://github.com/kritika618/terraform_new_modules.git//.modules/aws/ecs"
}
 
inputs = {
  environment           = "dev"
  ecs_cluster_name      = "dev-ecs-cluster"
  cluster_name          = "dev-ecs-cluster"
  task_family           = "dev-ecs-task"
  cpu                   = "256"
  memory                = "512"
  project_name          = "my-app"
  execution_role_arn    = "arn:aws:iam::273354669111:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name      = "web"
      image     = "nginx"
      cpu       = 128
      memory    = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  service_name     = "my-service"
  desired_count    = 1
  subnets          = ["subnet-0a433e5614138a125", "subnet-0cc71f61342a9a205"]
  security_groups  = ["sg-0a425b63089c65cd2"]
}

