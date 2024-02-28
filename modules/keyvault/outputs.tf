output "obj" {
  value = azurerm_key_vault.this 
  depends_on = [azurerm_key_vault.this]
}
