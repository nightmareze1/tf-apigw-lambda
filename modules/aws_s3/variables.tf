data "aws_caller_identity" "current" {}

variable "bucketname" {}

variable "tags" {
  type        = map(string)
}

variable "acl" {
  default = "private"
}
