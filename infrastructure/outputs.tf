output "cdn_domain" {
  description = "The CloudFront distribution domain name"
  value       = module.cdn.domain_name
}

output "storage_bucket" {
  description = "The S3 storage bucket name"
  value       = module.storage.bucket_name
}

# output "dns_record" {
#   description = "The Route53 DNS record name"
#   value       = module.dns.record_name
# }
