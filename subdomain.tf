data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
  env_id   = data.ns_workspace.this.env_id
}

locals {
  subdomain_part = data.ns_subdomain.this.subdomain_name
  fqdn           = data.ns_subdomain.this.fqdn
  is_passthrough = trimsuffix(local.fqdn, ".") == local.domain_name

  created_name        = try(aws_route53_zone.this[0].name, "")
  created_zone_id     = try(aws_route53_zone.this[0].zone_id, "")
  created_nameservers = try(aws_route53_zone.this[0].name_servers, [])

  subdomain_name        = local.is_passthrough ? local.domain_name : local.created_name
  subdomain_zone_id     = local.is_passthrough ? local.domain_zone_id : local.created_zone_id
  subdomain_nameservers = local.is_passthrough ? local.domain_nameservers : local.created_nameservers
}
