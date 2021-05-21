data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
}

locals {
  subdomain = var.create_vanity ? data.ns_subdomain.this.dns_name : "${data.ns_subdomain.this.dns_name}.${data.ns_workspace.this.env_name}"
}

resource "aws_route53_zone" "this" {
  name = "${local.subdomain}.${local.domain_name}"

  tags = data.ns_workspace.this.tags
}

// This record is added to the domain's zone to delegate this subdomain's records
resource "aws_route53_record" "this-delegation" {
  provider = aws.domain

  name    = local.subdomain
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.this.name_servers
}
