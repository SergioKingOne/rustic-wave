provider "aws" {
  region = var.aws_region
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.storage_bucket_name
  environment = var.environment
}

module "cdn" {
  source          = "./modules/cdn"
  bucket_name     = module.storage.bucket_name
  domain_name     = var.domain_name
  certificate_arn = var.certificate_arn
}

module "dns" {
  source         = "./modules/dns"
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  cdn_domain     = module.cdn.domain_name
}
