output "location" {
  description = "Resource group location"
  value       = local.location
}

output "name" {
  description = "Resource group name"
  value       = local.rg_name
}

output "id" {
  description = "resource group id"
  value       = azurerm_resource_group.main.id
}

output "rg" {
  description = "Resource group object"
  value       = azurerm_resource_group.main
}
