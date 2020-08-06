resource "aws_route53_zone" "this" {
  name = var.parent_blocks.domain == "" ? "${var.env}.${var.subdomain}" : "${var.subdomain}.${data.terraform_remote_state.domain[0].outputs.subdomain_name}"

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
