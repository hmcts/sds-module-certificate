output "secret_id" {
  value = data.azurerm_key_vault_certificate.cert.secret_id
}
output "id" {
  value = data.azurerm_key_vault_certificate.cert.id
}
output "thumbprint" {
  value = data.azurerm_key_vault_certificate.cert.thumbprint
}
output "key_vault_id" {
  value = var.key_vault_id
}
output "url" {
  value = replace(data.azurerm_key_vault_certificate.cert.secret_id, "/${data.azurerm_key_vault_certificate.cert.version}", "")
}
