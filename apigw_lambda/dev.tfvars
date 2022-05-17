# aws profile
aws_region = "us-east-1"
aws_profile = "zz"

# Network vars (You need configure VPC_ID and Subnets_ID previously deployed)
network_vpc_id = "vpc-0a2d2408224f0b3ec"
network_subnets_ids = ["subnet-0f50d5ef4412e03b8","subnet-060ffdb5c13ec70fe"]

# tags
environment = "dev"
environment_global = "dev"
project = "rt"
product = "app_code"
country = "global"

# tags resources by type
role_type_lambda = "lambda"
role_type_s3 = "s3"
role_type_sg = "security_group"
role_type_api_gw = "api_gateway"

# s3 vars
bucket_name = "app-code-storage"

# lambda vars
app_code_lambda_name = "app-code-lambda"
app_code_lambda_handler = "index.lambda_handler"
app_code_lambda_memory_size = "128"
app_code_lambda_concurrent_executions = "10"
app_code_lambda_runtime = "python3.9"
app_code_lambda_timeout = "10"
app_code_lambda_role_policies_file = ["lambda_app_code"]
app_code_lambda_role_aws_policies = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole","arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
app_code_sg_rules = [
  { type        = "ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["172.10.0.0/20"]
  },
  {
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
