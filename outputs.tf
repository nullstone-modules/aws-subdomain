output "name" {
  value       = local.name
  description = "string ||| The name that precedes the domain name for the created subdomain."
}

output "fqdn" {
  value       = local.fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created subdomain."
}

output "zone_id" {
  value       = local.zone_id
  description = "string ||| The zone ID of the AWS Route53 Zone for the created subdomain."
}

output "nameservers" {
  value       = local.nameservers
  description = "list(string) ||| The list of nameservers of the AWS Route53 Zone for the created subdomain."
}

output "domain_name" {
  value       = local.domain_name
  description = "string ||| The name of the root domain."
}

output "domain_zone_id" {
  value       = local.domain_zone_id
  description = "string ||| The zone ID of the root domain."
}

output "cert_arn" {
  value       = try(module.cert.certificate_arn, "")
  description = "string ||| If var.create_cert is enabled, the ARN of the SSL Certificate."
}
output "delegator" {
  value       = local.is_passthrough ? data.ns_connection.domain.outputs.delegator : (var.create_delegator ? module.delegator[0].delegator : { name : "", access_key : "", secret_key : "" })
  description = "object({ name: string, access_key: string, secret_key: string }) ||| "
  sensitive   = true
}
