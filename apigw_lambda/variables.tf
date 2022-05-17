## General variables
locals {
  common_tags = {
    project     = var.project
    product     = var.product
    env         = var.environment
    country     = var.country
    env_global  = var.environment_global
    terraform   = "true"
  }
}

variable "aws_region" {}

variable "aws_profile" {}

variable "country" {}

variable "product" {}

variable "environment" {}

variable "environment_global" {}

variable "project" {}

variable "bucket_name" {}

# Tag Resource type

variable "role_type_s3" {}

variable "role_type_lambda" {}

variable "role_type_sg" {}

variable "role_type_api_gw" {}

# Lambda app_code vars

variable "app_code_lambda_name" {}

variable "app_code_lambda_handler" {}

variable "app_code_lambda_memory_size" {}

variable "app_code_lambda_concurrent_executions" {}

variable "app_code_lambda_runtime" {}

variable "app_code_lambda_timeout" {}

variable "app_code_sg_rules" {
  type = list(any)
}

# Iam Role app_code vars

variable "app_code_lambda_role_policies_file" {
  type        = list(string)
}

variable "app_code_lambda_role_aws_policies" {
  type        = list(string)
}

# Networking vars
variable "network_vpc_id" {}

variable "network_subnets_ids" {
  type        = list(string)
}
