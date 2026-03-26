variable "create_delegator" {
  type        = bool
  description = "Enable this to create an IAM User that only has permissions to modify the created DNS Zone."
  default     = false
}
