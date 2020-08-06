data "terraform_remote_state" "domain" {
  count = var.parent_blocks.domain == "" ? 0 : 1

  backend = "pg"

  workspace = "${var.stack_name}-${var.env}-${var.parent_blocks.domain}"

  config = {
    conn_str    = var.backend_conn_str
    schema_name = var.owner_id
  }
}
