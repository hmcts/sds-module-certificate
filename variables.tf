variable "environment" {
  type        = string
  description = "Deployment Environment"
}
variable "domain_dns_prefix" {
  type        = string
  description = "Domain DNS Prefix e.g. {prefix}.{domain_dns_prefix}.platform.hmcts.net"
  default     = ""
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

variable "key_vault_id" {
  type        = string
}