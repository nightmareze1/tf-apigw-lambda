module "vpc" {
  source = "./modules/aws_vpc"

  name = format("%s-%s-vpc", var.project, var.environment)
  cidr = var.cidr
  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = {
    project     = var.project
    product     = var.product
    env         = var.environment
    country     = var.country
    env_global  = var.environment_global
    role        = "vpc"
    terraform   = "true"
  }
}
