module "cert" {
  source = "./cert"

  domain = var.create_vanity ? {
    name    = aws_route53_zone.vanity[0].name
    zone_id = aws_route53_zone.vanity[0].zone_id
    } : {
    name    = aws_route53_zone.env.name
    zone_id = aws_route53_zone.env.zone_id
  }

  alt_domains = var.create_vanity ? [{
    name    = aws_route53_zone.env.name
    zone_id = aws_route53_zone.env.zone_id
  }] : []

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
