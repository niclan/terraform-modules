resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  tags = {
    billed-service = var.billed-service
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_owner" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_owner]
  bucket = aws_s3_bucket.bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.bucket
  versioning_configuration {
    status = "Disabled"
  }
}

## Outputs here

output "s3_bucket" {
  value = aws_s3_bucket.bucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "s3_region" {
  value = aws_s3_bucket.bucket.region
}

output "s3_bucket_url" {
  value = aws_s3_bucket.bucket.bucket_domain_name
}

output "s3_regional_url" {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}

output "s3_bucket_id" {
  value = aws_s3_bucket.bucket.id
}
