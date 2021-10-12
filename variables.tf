variable "environment" {
  type        = string
  description = "Deployment Environment"
}
variable "domain_prefix" {
  type        = string
  description = "Prefix to the Certificate domain"
}

variable "object_id" {
  type        = string
  description = "(Optional) Object ID to grant access"
  default     = ""
}