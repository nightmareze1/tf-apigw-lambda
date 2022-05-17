module "iam_lambda_role" {
  source = "./modules/aws_iam_role"
  name = "AllowLambdaCustomRole"
  policies_file = var.app_code_lambda_role_policies_file
  aws_policies = var.app_code_lambda_role_aws_policies
  service = "lambda.amazonaws.com"
  path = "/"
}
