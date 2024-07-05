provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "nextjs_bucket" {
  bucket = "your-nextjs-app-bucket"
  tags = {
    Name = "Next.js App Bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "nextjs_bucket_ownership_controls" {
  bucket = aws_s3_bucket.nextjs_bucket.bucket

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "nextjs_bucket_public_access_block" {
  bucket = aws_s3_bucket.nextjs_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
