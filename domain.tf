data "ns_connection" "domain" {
  name     = "domain"
  type     = "domain/aws"
  contract = "domain/aws/route53"
}

locals {
  domain_name        = data.ns_connection.domain.outputs.name
  domain_zone_id     = data.ns_connection.domain.outputs.zone_id
  domain_nameservers = data.ns_connection.domain.outputs.nameservers
  domain_delegator   = data.ns_connection.domain.outputs.delegator
}

// We will need to be able to support secondary providers since the root domain
//   is typically managed in a separate account from non-production environments
provider "aws" {
  access_key = local.domain_delegator["access_key"]
  secret_key = local.domain_delegator["secret_key"]

  alias = "domain"
}
