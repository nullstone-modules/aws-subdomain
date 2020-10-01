output "domain_zone_id" {
  value = data.terraform_remote_state.domain.outputs.zone_id
}

output "domain_name" {
  value = data.terraform_remote_state.domain.outputs.name
}

output "vanity" {
  value = {
    name        = var.create_vanity ? aws_route53_zone.vanity[0].name : ""
    zone_id     = var.create_vanity ? aws_route53_zone.vanity[0].zone_id : ""
    nameservers = var.create_vanity ? aws_route53_zone.vanity[0].name_servers : []
  }
}

output "env" {
  value = {
    name        = aws_route53_zone.env.name
    zone_id     = aws_route53_zone.env.zone_id
    nameservers = aws_route53_zone.env.name_servers
  }
}

output "cert_arn" {
  value = module.cert.certificate_arn
}
