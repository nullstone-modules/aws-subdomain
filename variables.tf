variable "subdomain" {
  type        = string
  description = "This represents the token to prepend the input domain block (i.e. the fqdn is represented by {var.subdomain}.<domain>.)"
}

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

variable "verify_cert_by_email" {
  type        = bool
  description = "When enabled, this disables DNS verification of the subdomain. Instead, AWS will send an email to the domain registrant."
  default     = false
}
