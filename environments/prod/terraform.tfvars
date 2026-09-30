VPC_NAME = "app-vpc-prod"

VPC_CIDR_BLOCK = "10.3.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "prod"
  Project     = "app"
  ManagedBy   = "Terraform"
}

IGW_NAME = "app-igw-prod"

PUBLIC_SUBNET_CIDRS = [
  "10.3.1.0/24",
  "10.3.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.3.11.0/24",
  "10.3.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.3.21.0/24",
  "10.3.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "app-public-subnet-prod"
APP_SUBNET_NAME    = "app-private-app-subnet-prod"
DB_SUBNET_NAME     = "app-private-db-subnet-prod"

EIP_NAME         = "app-nat-eip-prod"
NAT_GATEWAY_NAME = "app-nat-gateway-prod"

PUBLIC_ROUTE_CIDR  = "0.0.0.0/0"
PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME   = "app-public-rt-prod"
PRIVATE_RT_NAME  = "app-private-rt-prod"
DATABASE_RT_NAME = "app-database-rt-prod"