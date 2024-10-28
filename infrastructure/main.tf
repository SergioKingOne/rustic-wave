provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

module "cdn" {
  source      = "./modules/cdn"
  bucket_name = var.storage_bucket_name
}

module "storage" {
  source             = "./modules/storage"
  bucket_name        = var.storage_bucket_name
  environment        = var.environment
  cloudfront_oai_arn = module.cdn.origin_access_identity_arn
}

# TODO: Uncomment this when we have a domain name
# module "dns" {
#   source         = "./modules/dns"
#   domain_name    = var.domain_name
#   hosted_zone_id = var.hosted_zone_id
#   cdn_domain     = module.cdn.domain_name
# }
