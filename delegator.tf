module "delegator" {
  source = "nullstone-modules/dns-delegator/aws"

  zone_id = aws_route53_zone.this.zone_id
  name    = "dns-delegator-${local.resource_name}"
  tags    = data.ns_workspace.this.tags

  count = var.create_delegator ? 1 : 0
}
