variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "The domain name for CloudFront"
  type        = string
}

# We'll uncomment this when we have SSL set up
# variable "certificate_arn" {
#   description = "ARN of the SSL certificate"
#   type        = string
# }
