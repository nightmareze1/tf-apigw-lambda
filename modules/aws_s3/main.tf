resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.bucketname)
    },
  )
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "texto.txt"
  source = "${path.module}/files/texto.txt"
  etag = filemd5("${path.module}/files/texto.txt")
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = var.bucketname
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "${aws_s3_bucket.bucket.id}",
  "Statement": [
    {
      "Sid": "${aws_s3_bucket.bucket.id}",
      "Effect": "Allow",
      "Principal": {
           "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": [
	  "s3:PutObject",
          "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::${var.bucketname}/*"
    }
  ]
}
POLICY
}

