output "network_vpc_id" {
  value = module.vpc.vpc_id
}

output "network_subnets_ids" {
  value = module.vpc.private_subnets
}
