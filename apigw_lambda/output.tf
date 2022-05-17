output "url" {
  value = module.app_code_api_gateway.invoke_url
}

output "path" {
  value = module.app_code_api_gateway.path_part
}
