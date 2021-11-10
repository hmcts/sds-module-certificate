

locals {
  domain_dns_prefix = var.domain_dns_prefix == "" ? var.environment : var.domain_dns_prefix
  env_long_name     = local.domain_dns_prefix == "sbox" ? "sandbox" : local.domain_dns_prefix == "stg" ? "staging" : local.domain_dns_prefix
  host_name         = local.env_long_name == "prod" ? "${var.domain_prefix}.platform.hmcts.net" : "${var.domain_prefix}.${local.env_long_name}.platform.hmcts.net"
  cert_name         = replace(local.host_name, ".", "-")
}

## Get Secret
data "azurerm_key_vault" "kv" {
  name                = "acmedtssds${var.environment}"
  resource_group_name = "sds-platform-${var.environment}-rg"
}
data "azurerm_key_vault_certificate" "cert" {
  name         = local.cert_name
  key_vault_id = data.azurerm_key_vault.kv.id

  depends_on = [
    azurerm_role_assignment.kv_access,
    azurerm_key_vault_access_policy.policy
  ]
}

## Key Vault Access
resource "azurerm_role_assignment" "kv_access" {
  count                = var.object_id == "" ? 0 : 1
  scope                = data.azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.object_id
}

