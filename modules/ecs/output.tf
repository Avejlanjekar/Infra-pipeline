# ---------------------------------------------------------
# ECS Cluster Outputs
# ---------------------------------------------------------

output "ECS_CLUSTER_ID" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.this_cluster.id
}

output "ECS_CLUSTER_ARN" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.this_cluster.arn
}

output "ECS_CLUSTER_NAME" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.this_cluster.name
}


# ---------------------------------------------------------
# ECS Task Definition Outputs
# ---------------------------------------------------------

output "BACKEND_TASK_DEFINITION_ARN" {
  description = "ARN of the backend ECS task definition"
  value       = aws_ecs_task_definition.this_backend.arn
}

output "FRONTEND_TASK_DEFINITION_ARN" {
  description = "ARN of the frontend ECS task definition"
  value       = aws_ecs_task_definition.this_frontend.arn
}

output "DATABASE_TASK_DEFINITION_ARN" {
  description = "ARN of the database ECS task definition"
  value       = aws_ecs_task_definition.this_database.arn
}

