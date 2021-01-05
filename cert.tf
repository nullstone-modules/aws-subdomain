module "cert" {
  source = "./cert"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  verify_by_email = var.verify_cert_by_email
  tags            = data.ns_workspace.this.tags
}
