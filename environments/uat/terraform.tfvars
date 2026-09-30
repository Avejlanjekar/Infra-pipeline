VPC_NAME = "app-vpc-uat"

VPC_CIDR_BLOCK = "10.2.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "uat"
  Project     = "app"
  ManagedBy   = "Terraform"
}

IGW_NAME = "app-igw-uat"

PUBLIC_SUBNET_CIDRS = [
  "10.2.1.0/24",
  "10.2.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.2.11.0/24",
  "10.2.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.2.21.0/24",
  "10.2.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "app-public-subnet-uat"
APP_SUBNET_NAME    = "app-private-app-subnet-uat"
DB_SUBNET_NAME     = "app-private-db-subnet-uat"

EIP_NAME         = "app-nat-eip-uat"
NAT_GATEWAY_NAME = "app-nat-gateway-uat"

PUBLIC_ROUTE_CIDR  = "0.0.0.0/0"
PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME   = "app-public-rt-uat"
PRIVATE_RT_NAME  = "app-private-rt-uat"
DATABASE_RT_NAME = "app-database-rt-uat"