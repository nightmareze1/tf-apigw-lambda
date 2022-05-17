output "bucket-domain" {
  value = aws_s3_bucket.bucket.bucket_domain_name
}

output "bucket" {
  value = aws_s3_bucket.bucket.bucket
}

output "arn" {
  value = aws_s3_bucket.bucket.arn
}

