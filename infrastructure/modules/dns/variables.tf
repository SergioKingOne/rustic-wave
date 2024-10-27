variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "hosted_zone_id" {
  description = "The Route53 Hosted Zone ID"
  type        = string
}

variable "cdn_domain" {
  description = "The CloudFront distribution domain"
  type        = string
}
