resource "aws_route53_record" "www" {
  zone_id         = var.hosted_zone_id
  name            = var.domain_name
  type            = "A"
  allow_overwrite = true

  alias {
    name                   = var.cdn_domain
    zone_id                = "Z2FDTNDATAQYW2" # CloudFront Zone ID
    evaluate_target_health = false
  }
}

output "record_name" {
  value = aws_route53_record.www.name
}
