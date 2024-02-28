
resource "azurerm_sql_server" "this" {
 for_each = { for k, v in (var.azure_sqlserver_input): v.sqlserver_name => v }
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.sqlversion
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  tags = var.tags
  extended_auditing_policy {
    storage_endpoint                        = var.primary_blob_endpoint
    storage_account_access_key              = var.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }
}
