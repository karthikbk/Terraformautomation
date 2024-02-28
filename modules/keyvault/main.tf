data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "this" {
  for_each = { for k, v in (var.keyvault): v.name => v }
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name = each.value.sku_name
  tags=each.value.tags  
}
resource "azurerm_key_vault_access_policy" "example" {
  for_each = { for k, v in (var.keyvaultaccesspolicy): v.object_id => v }
  key_vault_id = azurerm_key_vault.this["${each.value.keyvaultname}"].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = each.value.object_id
  # key_permissions = each.value.key_permissions
  # secret_permissions = each.value.secret_permissions
  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
    "purge"
  ]

  certificate_permissions = [
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "setissuers",
    "update",
    "backup",
    "restore",
  ]

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
    "purge"
  ]
}
# resource "azurerm_key_vault_access_policy" "jenkins" {
#   for_each = { for k, v in (var.keyvaultaccesspolicy): v.object_id => v }
#   key_vault_id = azurerm_key_vault.this["${each.value.keyvaultname}"].id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = "3ecf1ff6-00c5-44b5-94ad-201242500c53"
#   key_permissions =  ["Backup","Create","Decrypt","Delete","Encrypt","Get","Import","List","Purge","Recover","Restore","Sign","UnwrapKey","Update","Verify","WrapKey"]
#   secret_permissions = [ "Backup","Delete","get","list","purge","recover","restore","set"]
#   certificate_permissions =  ["Backup","Create","Delete","DeleteIssuers","Get","GetIssuers","Import","List","ListIssuers","ManageContacts","ManageIssuers","Purge","Recover","Restore","SetIssuers","Update"]
#   storage_permissions  = ["Backup","Delete","DeleteSAS","Get","GetSAS","List","ListSAS","Purge","Recover","RegenerateKey","Restore","Set","SetSAS","Update"]
# # }

## This is not generic and need attention

# resource "azurerm_key_vault_access_policy" "adminuser" {
#   for_each     = var.key_vault_admin_users
#   key_vault_id = var.key_vault_id
#   tenant_id    = each.value.tenant_id
#   object_id    = each.value.object_id

#   secret_permissions = [
#     "get",
#     "list",
#     "set",
#     "delete",
#     "recover",
#     "backup",
#     "restore",
#     "purge"
#   ]

#   certificate_permissions = [
#     "create",
#     "delete",
#     "deleteissuers",
#     "get",
#     "getissuers",
#     "import",
#     "list",
#     "listissuers",
#     "managecontacts",
#     "manageissuers",
#     "purge",
#     "recover",
#     "setissuers",
#     "update",
#     "backup",
#     "restore",
#   ]

#   key_permissions = [
#     "get",
#     "list",
#     "update",
#     "create",
#     "import",
#     "delete",
#     "recover",
#     "backup",
#     "restore",
#     "purge"
#   ]
# }
