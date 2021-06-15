module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = local.fqdn
    zone_id = local.zone_id
  }

  enabled = var.create_cert
  tags    = data.ns_workspace.this.tags
}
