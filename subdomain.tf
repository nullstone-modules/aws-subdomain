data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
}

locals {
  subdomain_dns_name = data.ns_subdomain.this.dns_name
}

resource "aws_route53_zone" "this" {
  name = local.fqdn
  tags = local.tags

  count = !local.is_passthrough ? 1 : 0
}

resource "aws_route53_record" "this-delegation" {
  provider = aws.domain

  name    = local.subdomain
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.this[count.index].name_servers

  count = !local.is_passthrough ? 1 : 0
}
