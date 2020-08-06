resource "aws_route53_zone" "this" {
  name = "${var.env}.${var.subdomain}"

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
