locals {
  subdomain = var.create_vanity ? var.subdomain : "${var.subdomain}.${var.env}"
}

resource "aws_route53_zone" "this" {
  name = "${local.subdomain}.${local.domain_name}"

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
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
