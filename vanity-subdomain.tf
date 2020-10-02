// Vanity subdomain zone (separate from environmental)
resource "aws_route53_zone" "vanity" {
  name = "${var.subdomain}.${local.domain_name}"

  count = var.create_vanity ? 1 : 0

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}

// Delegation for vanity subdomain
// This record is added to the domain's zone to delegate this subdomain's records
resource "aws_route53_record" "vanity-delegation" {
  provider = aws.domain

  count = var.create_vanity ? 1 : 0

  name    = var.subdomain
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.vanity[0].name_servers
}
