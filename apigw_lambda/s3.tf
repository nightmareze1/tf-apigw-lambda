module "app-code-storage" {
  source        = "./modules/aws_s3"
  bucketname    = var.bucket_name
  tags = merge(
    local.common_tags,
    {
      "role" = format("%s", var.role_type_s3)
    },
  )

}
