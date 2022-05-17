variable "name" {
  description = "Resource Name [ string ]"
}

variable "vpc_id" {
  type        = string
}

variable "description" {
  type        = string
  default     = "Managed by Terraform"
}

variable "id" {
  type        = string
  default     = ""
}

variable "rules" {
  type        = list(any)
  default     = null
}

variable "tags" {
  type        = map(string)
}
