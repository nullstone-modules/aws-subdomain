variable "create_vanity" {
  type        = bool
  description = <<EOF
Enable this to create vanity subdomain instead of environmental.
This is typically enabled on the production environment.
If dns-name is set to '.' and create_vanity is enabled, this will module act as a passthrough; outputs from the connected domain are used for outputs.
EOF
  default     = false
}

variable "create_cert" {
  type        = bool
  description = "Enable this to create an SSL certificate through AWS ACM service."
  default     = true
}

variable "create_delegator" {
  type        = bool
  description = "Enable this to create an IAM User that only has permissions to modify the created DNS Zone."
  default     = false
}
