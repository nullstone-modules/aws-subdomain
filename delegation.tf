// We will need to be able to support secondary providers since the root domain
//   is typically managed in a separate account from non-production environments
provider "aws" {
  alias = "domain"
}

// This record is added to the domain's zone to delegate this subdomain's records
resource "aws_route53_record" "delegation" {
  provider = aws.domain

  name    = var.subdomain
  zone_id = data.terraform_remote_state.domain.outputs.subdomain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.root.name_servers
}
