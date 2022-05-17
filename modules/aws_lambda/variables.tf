variable "function_name" {}

variable "description" {}

variable "role" {}

variable "handler" {}

variable "memory_size" {}

variable "concurrent_executions" {}

variable "runtime" {}

variable "timeout" {}

variable "lambda_environment" {
  type = map(string)
}

variable "tags" {
  type        = map(string)
}

variable "security_group_ids" {}

variable "subnets_ids" {
  type        = list(string)
}
