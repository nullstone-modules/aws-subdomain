resource "aws_route53_zone" "root" {
  name = var.parent_blocks.domain == "" ? "${var.env}.${var.subdomain}" : "${var.subdomain}.${data.terraform_remote_state.domain[0].outputs.subdomain_name}"

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}

resource "aws_route53_record" "nested" {
  count = var.parent_blocks.domain == "" ? 0 : 1

  name    = var.subdomain
  zone_id = data.terraform_remote_state.domain[0].outputs.subdomain_zone_id
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.root.name_servers
}
