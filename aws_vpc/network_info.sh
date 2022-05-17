#!/bin/bash

terraform init

terraform refresh

echo ""

echo "Network Info! update this variables in ../apigw_lambda/terraform.tfvars"

echo ""

echo network_vpc_id = +$(terraform output network_vpc_id)+ | sed s@'+'@'"'@g 

echo network_subnets_ids = $(terraform output network_subnets_ids) | sed s@'", ]'@'"]'@g | tr -d ' ' | sed s@'='@' = '@g
