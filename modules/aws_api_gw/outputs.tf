output "invoke_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

output "path_part" {
  value = aws_api_gateway_resource.resource.path_part
}
