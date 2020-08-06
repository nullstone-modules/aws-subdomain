output "subdomain_zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "subdomain_nameservers" {
  value = aws_route53_zone.this.name_servers
}

output "subdomain_name" {
  value = aws_route53_zone.this.name
}
