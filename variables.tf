variable "owner_id" {
  type = string
}

variable "stack_name" {
  type = string
}

variable "env" {
  type = string
}

variable "block_name" {
  type = string
}

variable "parent_blocks" {
  type = object({
    domain : string
  })
}

variable "backend_conn_str" {
  type = string
}


variable "subdomain" {
  type        = string
  description = "This represents the token to prepend the input domain block (i.e. the fqdn is represented by {var.subdomain}.<domain>.)"
}
