VPC_NAME = "app-vpc-qa"

VPC_CIDR_BLOCK = "10.1.0.0/16"

ENABLE_DNS_HOSTNAMES = true
ENABLE_DNS_SUPPORT   = true

VPC_COMMON_TAGS = {
  Environment = "qa"
  Project     = "app"
  ManagedBy   = "Terraform"
}

IGW_NAME = "app-igw-qa"

PUBLIC_SUBNET_CIDRS = [
  "10.1.1.0/24",
  "10.1.2.0/24"
]

APP_SUBNET_CIDRS = [
  "10.1.11.0/24",
  "10.1.12.0/24"
]

DB_SUBNET_CIDRS = [
  "10.1.21.0/24",
  "10.1.22.0/24"
]

AVAILABILITY_ZONES = [
  "ap-south-1a",
  "ap-south-1b"
]

PUBLIC_SUBNET_NAME = "app-public-subnet-qa"
APP_SUBNET_NAME    = "app-private-app-subnet-qa"
DB_SUBNET_NAME     = "app-private-db-subnet-qa"

EIP_NAME         = "app-nat-eip-qa"
NAT_GATEWAY_NAME = "app-nat-gateway-qa"

PUBLIC_ROUTE_CIDR  = "0.0.0.0/0"
PRIVATE_ROUTE_CIDR = "0.0.0.0/0"

PUBLIC_RT_NAME   = "app-public-rt-qa"
PRIVATE_RT_NAME  = "app-private-rt-qa"
DATABASE_RT_NAME = "app-database-rt-qa"