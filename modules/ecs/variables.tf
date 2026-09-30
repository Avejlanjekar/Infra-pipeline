variable "ECS_CLUSTER_NAME" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ECS_CLUSTER_SETTING_NAME" {
  description = "Name of the ECS cluster setting"
  type        = string
}

variable "ECS_CLUSTER_SETTING_VALUE" {
  description = "Value of the ECS cluster setting"
  type        = string
}


variable "BACKEND_TASK_DEFINITION_FAMILY" {
  description = "Family name of the backend ECS task definition"
  type        = string
}

variable "FRONTEND_TASK_DEFINITION_FAMILY" {
  description = "Family name of the frontend ECS task definition"
  type        = string
}

variable "DATABASE_TASK_DEFINITION_FAMILY" {
  description = "Family name of the database ECS task definition"
  type        = string
}

variable "BACKEND_CONTAINER_NAME" {
  description = "Name of the backend container"
  type        = string
}

variable "FRONTEND_CONTAINER_NAME" {
  description = "Name of the frontend container"
  type        = string
}

variable "DATABASE_CONTAINER_NAME" {
  description = "Name of the database container"
  type        = string
}

variable "BACKEND_IMAGE" {
  description = "Initial backend ECR image URI"
  type        = string
}

variable "FRONTEND_IMAGE" {
  description = "Initial frontend ECR image URI"
  type        = string
}

variable "DATABASE_IMAGE" {
  description = "Initial database ECR image URI"
  type        = string
}

variable "ECS_TASK_EXECUTION_ROLE_ARN" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "ECS_TASK_CPU" {
  description = "CPU units for ECS Fargate tasks"
  type        = string
}

variable "ECS_TASK_MEMORY" {
  description = "Memory for ECS Fargate tasks"
  type        = string
}

variable "ECS_NETWORK_MODE" {
  description = "Network mode for ECS tasks"
  type        = string
}

variable "ECS_REQUIRES_COMPATIBILITIES" {
  description = "Launch compatibility for ECS tasks"
  type        = list(string)
}

variable "BACKEND_CONTAINER_PORT" {
  description = "Backend container port"
  type        = number
}

variable "FRONTEND_CONTAINER_PORT" {
  description = "Frontend container port"
  type        = number
}

variable "DATABASE_CONTAINER_PORT" {
  description = "Database container port"
  type        = number
}

variable "BACKEND_LOG_GROUP_NAME" {
  description = "CloudWatch log group for backend"
  type        = string
}

variable "FRONTEND_LOG_GROUP_NAME" {
  description = "CloudWatch log group for frontend"
  type        = string
}

variable "DATABASE_LOG_GROUP_NAME" {
  description = "CloudWatch log group for database"
  type        = string
}

variable "AWS_REGION" {
  description = "AWS region used by ECS logging"
  type        = string
}

variable "BACKEND_DB_NAME" {
  description = "Database name used by the backend"
  type        = string
}

variable "BACKEND_DB_HOST" {
  description = "Database hostname used by the backend"
  type        = string
}

variable "BACKEND_DB_PORT" {
  description = "Database port used by the backend"
  type        = string
}

variable "BACKEND_DB_USER" {
  description = "Database username used by the backend"
  type        = string
}

variable "BACKEND_DB_PASSWORD" {
  description = "Database password used by the backend"
  type        = string
}

variable "DATABASE_NAME" {
  description = "MySQL database name"
  type        = string
}

variable "DATABASE_ROOT_PASSWORD" {
  description = "MySQL root password"
  type        = string
}

variable "FRONTEND_BACKEND_HOST" {
  description = "Backend hostname used by the frontend"
  type        = string
}

# ---------------------------------------------------------
# ECS Services
# ---------------------------------------------------------

variable "BACKEND_SERVICE_NAME" {
  description = "Name of the backend ECS service"
  type        = string
}

variable "FRONTEND_SERVICE_NAME" {
  description = "Name of the frontend ECS service"
  type        = string
}

variable "DATABASE_SERVICE_NAME" {
  description = "Name of the database ECS service"
  type        = string
}

variable "ECS_SERVICE_DESIRED_COUNT" {
  description = "Desired number of ECS tasks for each service"
  type        = number
}

variable "ECS_LAUNCH_TYPE" {
  description = "ECS service launch type"
  type        = string
}

variable "ECS_ASSIGN_PUBLIC_IP" {
  description = "Whether ECS tasks receive public IP addresses"
  type        = bool
}

variable "ECS_APP_SUBNET_IDS" {
  description = "Private application subnet IDs for frontend and backend ECS services"
  type        = list(string)
}

variable "ECS_DB_SUBNET_IDS" {
  description = "Private database subnet IDs for database ECS service"
  type        = list(string)
}

variable "ECS_SECURITY_GROUP_ID" {
  description = "Security group ID attached to ECS tasks"
  type        = string
}

variable "DB_SECURITY_GROUP_ID" {
  type = string
}

variable "BACKEND_TARGET_GROUP_ARN" {
  description = "ALB target group ARN for backend"
  type        = string
}

variable "FRONTEND_TARGET_GROUP_ARN" {
  description = "ALB target group ARN for frontend"
  type        = string
}

variable "ENABLE_BACKEND_LOAD_BALANCER" {
  description = "Whether backend ECS service should attach to an ALB target group"
  type        = bool
}

variable "ENABLE_FRONTEND_LOAD_BALANCER" {
  description = "Whether frontend ECS service should attach to an ALB target group"
  type        = bool
}

# ---------------------------------------------------------
# Cloud Map Service Discovery
# ---------------------------------------------------------

variable "BACKEND_CLOUD_MAP_SERVICE_ARN" {
  description = "ARN of the Cloud Map backend service"
  type        = string
}

variable "FRONTEND_CLOUD_MAP_SERVICE_ARN" {
  description = "ARN of the Cloud Map frontend service"
  type        = string
}

variable "DATABASE_CLOUD_MAP_SERVICE_ARN" {
  description = "ARN of the Cloud Map database service"
  type        = string
}

variable "COMMON_TAGS" {
  description = "Common tags for ALB resources"
  type        = map(string)
}