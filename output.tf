output "secret_id" {
  value = data.azurerm_key_vault_certificate.cert.secret_id
}
output "id" {
  value = data.azurerm_key_vault_certificate.cert.id
}
output "thumbprint" {
  value = data.azurerm_key_vault_certificate.cert.thumbprint
}