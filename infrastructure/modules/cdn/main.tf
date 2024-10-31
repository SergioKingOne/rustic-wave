resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = "${var.bucket_name}.s3.amazonaws.com"
    origin_id   = "S3-${var.bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CDN for ${var.bucket_name}"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3-${var.bucket_name}"
    viewer_protocol_policy = "allow-all"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
    compress    = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Environment = "dev"
    Name        = "CDN-${var.bucket_name}"
    ManagedBy   = "Terraform"
    BucketName  = var.bucket_name
  }

  aliases = [var.domain_name]

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
      comment,
      enabled
    ]
  }
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI for ${var.bucket_name}"
}

output "domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "origin_access_identity_arn" {
  value = aws_cloudfront_origin_access_identity.this.iam_arn
}
