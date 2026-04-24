data "ns_connection" "domain" {
  name     = "domain"
  contract = "domain/aws/route53"
}

locals {
  domain_name        = data.ns_connection.domain.outputs.name
  domain_zone_id     = data.ns_connection.domain.outputs.zone_id
  domain_nameservers = data.ns_connection.domain.outputs.nameservers
  domain_delegator   = data.ns_connection.domain.outputs.delegator

  domain_access_key = try(local.domain_delegator["access_key"], "")
  domain_secret_key = try(local.domain_delegator["secret_key"], "")
  domain_assume_role = try(local.domain_delegator["role_arn"], "") == "" ? [] : [
    {
      role_arn : local.domain_delegator["role_arn"]
      duration : local.domain_delegator["session_duration"]
    }
  ]
}

// We create an aliased provider since the domain is usually in a separate AWS account
provider "aws" {
  access_key = local.domain_access_key
  secret_key = local.domain_secret_key

  dynamic "assume_role" {
    for_each = local.domain_assume_role
    iterator = ar

    content {
      role_arn = ar.value["role_arn"]
      duration = ar.value["duration"]
    }
  }

  alias = "domain"
}
