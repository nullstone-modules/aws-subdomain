module "delegator" {
  source = "nullstone-modules/dns-delegator/aws"

  zone_id = aws_route53_zone.this[0].zone_id
  name    = "dns-delegator-${local.resource_name}"
  tags    = local.tags

  count = var.create_delegator && !local.is_passthrough ? 1 : 0
}
