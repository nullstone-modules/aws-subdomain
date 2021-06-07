module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  enabled = var.create_cert
  tags    = data.ns_workspace.this.tags
}
