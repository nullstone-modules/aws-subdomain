resource "aws_route53_zone" "this" {
  name = trimsuffix(local.fqdn, ".")
  tags = local.tags

  count = !local.is_passthrough ? 1 : 0
}

resource "aws_route53_record" "this-delegation" {
  provider = aws.domain

  name    = local.subdomain_part
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.this[count.index].name_servers

  count = !local.is_passthrough ? 1 : 0
}
