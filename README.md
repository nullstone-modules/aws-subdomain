# block-aws-subdomain

Nullstone Block standing up a subdomain in AWS Route53 for each environment.

## Inputs

- `create_vanity: bool (default: false)` - Enable this to create a vanity subdomain instead of environmental. This is typically enabled on the production environment.
- `create_cert: bool (default: true)` - Enable this to create an SSL certificate through AWS ACM service.

## Outputs

- `name: string` - The name that precedes the domain name for the created subdomain.
- `fqdn: string` - The FQDN (fully-qualified domain name) for the created subdomain.
- `zone_id: string` - The zone ID of the AWS Route53 Zone for the created subdomain.
- `nameservers: list(string)` - The list of nameservers of the AWS Route53 Zone for the created subdomain.
- `domain_name: string` - The name of the root domain.
- `domain_zone_id: string` - The zone ID of the root domain.
- `cert_arn: string` - If var.create_cert is enabled, the ARN of the SSL Certificate.
