output "domain" {
  value = {
    name    = data.terraform_remote_state.domain.outputs.name
    zone_id = data.terraform_remote_state.domain.outputs.zone_id
  }
}

output "subdomain" {
  value = {
    name        = aws_route53_zone.this.name
    zone_id     = aws_route53_zone.this.zone_id
    nameservers = aws_route53_zone.this.name_servers
  }
}

output "cert_arn" {
  value = module.cert.certificate_arn
}
