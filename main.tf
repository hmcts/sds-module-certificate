

locals {
  env_long_name = var.environment == "sbox" ? "sandbox" : var.environment == "stg" ? "staging" : var.environment
  host_name     = local.env_long_name == "prod" ? "${var.domain_prefix}.platform.hmcts.net" : "${var.domain_prefix}.${local.env_long_name}.platform.hmcts.net"
  cert_name     = replace(local.host_name, ".", "-")
}

## Get Secret
data "azurerm_key_vault" "kv" {
  name                = "acmedtssds${var.environment}"
  resource_group_name = "sds-platform-${var.environment}-rg"
}
data "azurerm_key_vault_certificate" "cert" {
  name         = local.cert_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

## Key Vault Access
resource "azurerm_role_assignment" "kv_access" {
  count                = var.object_id == "" ? 0 : 1
  scope                = data.azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.object_id
}
data "azurerm_client_config" "this" {
}
resource "azurerm_key_vault_access_policy" "policy" {
  count                   = var.object_id == "" ? 0 : 1
  key_vault_id            = data.azurerm_key_vault.kv.id
  tenant_id               = data.azurerm_client_config.this.tenant_id
  object_id               = var.object_id
  key_permissions         = []
  secret_permissions      = ["Get", "List"]
  certificate_permissions = ["Get", "List"]
  storage_permissions     = []
}
