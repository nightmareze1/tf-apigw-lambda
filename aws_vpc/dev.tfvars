# aws profile
aws_region = "us-east-1"
aws_profile = "zz"

# tags

environment = "dev"
environment_global = "dev"
project = "rt"
product = "rt_core"
country = "global"

## VPC vars

cidr = "172.10.0.0/20"

enable_nat_gateway     = true
single_nat_gateway     = false
one_nat_gateway_per_az = true
enable_dns_hostnames   = true
enable_vpn_gateway     = false

azs             = ["us-east-1a", "us-east-1b"]
private_subnets     = ["172.10.1.0/24", "172.10.2.0/24"]
public_subnets      = ["172.10.3.0/24", "172.10.4.0/24"]
