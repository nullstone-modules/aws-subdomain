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

// If parent_blocks.domain is specified,
//   output `subdomain_name` from that block is used as base domain for created subdomain
variable "parent_blocks" {
  type = object({
    domain : string
  })

  default = {
    domain = ""
  }
}

variable "backend_conn_str" {
  type = string
}

// If parent_blocks.domain is "", subdomain is used as created subdomain
// If parent_blocks.domain is not "", subdomain is used as prefix to created subdomain
variable "subdomain" {
  type = string
}
