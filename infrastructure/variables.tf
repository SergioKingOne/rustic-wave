variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (dev/prod)"
  type        = string
}

variable "storage_bucket_name" {
  description = "The name of the storage S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "The Route53 Hosted Zone ID"
  type        = string
}
