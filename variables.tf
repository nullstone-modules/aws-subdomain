variable "create_vanity" {
  type        = bool
  description = "Enable this to create vanity subdomain instead of environmental. This is typically enabled on the production environment."
  default     = false
}

variable "create_cert" {
  type        = bool
  description = "Enable this to create an SSL certificate through AWS ACM service."
  default     = true
}
