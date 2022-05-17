resource "aws_lambda_function" "main" {
  function_name                  = var.function_name
  description                    = var.description
  role                           = var.role
  handler                        = var.handler
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.concurrent_executions
  runtime                        = var.runtime
  timeout                        = var.timeout
  vpc_config {
    security_group_ids = [var.security_group_ids]
    subnet_ids         = var.subnets_ids
  }
  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.function_name)
    },
  )
  environment {
    variables = var.lambda_environment
  }
  filename = "${path.module}/resources/empty_code.zip"
  lifecycle {
    ignore_changes = [
      filename,
      last_modified,
    ]
  }
}

resource "aws_cloudwatch_log_group" "main" {
  name = "/aws/lambda/${var.function_name}"
  retention_in_days = 30
}
