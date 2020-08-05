# block-aws-subdomain

Nullstone Block standing up a subdomain in AWS Route53 for each environment.

## Inputs

- `owner_id: string` - Stack Owner ID
- `stack_name: string` - Stack Name
- `block_name: string` - Block Name
- `parent_block: string` - Parent Block
- `env: string` - Environment Name
- `backend_conn_str: string` - Connection string for postgres backend

- `subdomain: string` - Subdomain to configure

## Outputs

- `subdomain_zone_id: string` - Route53 Zone ID of Subdomain
- `subdomain_nameservers: list(string)` - List of Nameservers for Route53 Zone
