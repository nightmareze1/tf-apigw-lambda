module "app_code_lambda_function" {
  source = "./modules/aws_lambda"
  function_name = join("-", [var.app_code_lambda_name])
  description   = "Lambda function to process measurements"
  handler       = var.app_code_lambda_handler
  memory_size   = var.app_code_lambda_memory_size
  concurrent_executions = var.app_code_lambda_concurrent_executions
  runtime       = var.app_code_lambda_runtime
  timeout       = var.app_code_lambda_timeout
  subnets_ids   = var.network_subnets_ids

  security_group_ids = module.app_code_sg.id
  role = module.iam_lambda_role.arn

  lambda_environment = {
      VARIABLE      = "if_need_vars"
  }

  tags = merge(
    local.common_tags,
    {
      "role" = format("%s", var.role_type_lambda)
    },
  )
}

module "app_code_sg" {
  source = "./modules/aws_security_group"
  name = join("-", [var.app_code_lambda_name, "sg", var.environment])
  vpc_id = var.network_vpc_id
  rules = var.app_code_sg_rules
  tags = merge(
    local.common_tags,
    {
      "role" = format("%s", var.role_type_sg)
    },
  )
}


module "app_code_api_gateway" {
  source = "./modules/aws_api_gw"
  name = join("-", [var.app_code_lambda_name, "gateway", var.environment])
  function_name = join("-", [var.app_code_lambda_name])
  lambda_arn = module.app_code_lambda_function.arn
  resource_path = "holamundo"
  tags = merge(
    local.common_tags,
    {
      "role" = format("%s", var.role_type_api_gw)
    },
  )
}
