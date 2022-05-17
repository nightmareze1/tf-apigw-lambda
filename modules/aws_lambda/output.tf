output "arn" {
  value = aws_lambda_function.main.arn
}

output "name" {
  description = "Name of the Lambda function."
  value = aws_lambda_function.main.function_name
}
