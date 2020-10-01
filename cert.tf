module "cert" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 2.11.0"

  create_certificate = var.create_cert

  domain_name               = var.create_vanity ? aws_route53_zone.vanity.name : aws_route53_zone.env.name
  subject_alternative_names = var.create_vanity ? [aws_route53_zone.env.name] : []
  zone_id                   = local.domain_zone_id
}
