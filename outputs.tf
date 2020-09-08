output "domain_zone_id" {
  value = data.terraform_remote_state.domain.outputs.zone_id
}

output "domain_name" {
  value = data.terraform_remote_state.domain.outputs.name
}

output "vanity" {
  value = {
    name        = var.create_vanity ? aws_route53_zone.vanity.name : ""
    zone_id     = var.create_vanity ? aws_route53_zone.vanity.zone_id : ""
    nameservers = var.create_vanity ? aws_route53_zone.vanity.name_servers : ""
  }
}

output "env" {
  value = {
    name        = aws_route53_zone.env.name
    zone_id     = aws_route53_zone.env.zone_id
    nameservers = aws_route53_zone.env.name_servers
  }
}
