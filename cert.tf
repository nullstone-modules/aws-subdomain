module "cert" {
  source = "./cert"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
