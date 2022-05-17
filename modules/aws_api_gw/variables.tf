variable "name" {}
variable "lambda_arn" {}
variable "resource_path" {}
variable "function_name" {}
variable "tags" {
  type        = map(string)
}

variable "api_gateway_endpoint_method" {
  default     = "GET"
}

variable "api_gateway_deployment_stage_name" {
  default     = "dev"
}
