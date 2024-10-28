variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The deployment environment (dev/prod)"
  type        = string
}

variable "cloudfront_oai_arn" {
  description = "The ARN of the CloudFront Origin Access Identity"
  type        = string
}
