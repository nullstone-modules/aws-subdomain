resource "aws_route53_zone" "root" {
  name = "${var.subdomain}.${data.terraform_remote_state.domain.outputs.domain_name}"

  tags = {
    Stack       = var.stack_name
    Environment = var.env
    Block       = var.block_name
  }
}
