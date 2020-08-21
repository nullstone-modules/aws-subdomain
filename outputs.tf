output "domain_zone_id" {
  value = data.terraform_remote_state.domain.outputs.domain_zone_id
}

output "domain_name" {
  value = data.terraform_remote_state.domain.outputs.domain_name
}

output "subdomain_zone_id" {
  value = aws_route53_zone.root.zone_id
}

output "subdomain_nameservers" {
  value = aws_route53_zone.root.name_servers
}

output "subdomain_name" {
  value = aws_route53_zone.root.name
}
