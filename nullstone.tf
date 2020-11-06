data "ns_workspace" "this" {}

data "ns_connection" "domain" {
  name = "domain"
  type = "domain/aws"
}

// We will need to be able to support secondary providers since the root domain
//   is typically managed in a separate account from non-production environments
provider "aws" {
  access_key = data.ns_connection.domain.outputs.delegator["access_key"]
  secret_key = data.ns_connection.domain.outputs.delegator["secret_key"]

  alias = "domain"
}

locals {
  domain_name    = data.ns_connection.domain.outputs.name
  domain_zone_id = data.ns_connection.domain.outputs.zone_id
}
