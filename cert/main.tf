variable "domain" {
  description = "A domain name for which the certificate should be issued. Zone ID is used to create validation records"
  type = object({
    name : string
    zone_id : string
  })
}

variable "alt_domains" {
  description = "A list of domains that should be SANs in the issued certificate. Zone IDs are used to create validation records"
  type = list(object({
    name : string
    zone_id : string
  }))
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

locals {
  names = concat([var.domain.name], var.alt_domains[*].name)
  zone_ids = concat([var.domain.zone_id], var.alt_domains[*].zone_id)
  zone_id_lookup = zipmap(local.names, local.zone_ids)
}

resource "aws_acm_certificate" "this" {
  domain_name               = var.domain.name
  validation_method         = "DNS"
  subject_alternative_names = var.alt_domains[*].name

  tags = var.tags
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name            = each.value.name
  type            = each.value.type
  allow_overwrite = true
  zone_id         = lookup(local.zone_id_lookup, each.value.name)
  records         = [each.value.record]
  ttl             = 60
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}
