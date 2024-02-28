
resource "azurerm_storage_account" "this" {
  for_each = { for k, v in (var.azurerm_storage_data_lake): v.datalakename => v }
  name                              = each.value.storagename
  tags                              = each.value.tags
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  account_tier                      = each.value.account_tier
  account_kind                      = each.value.account_kind
  account_replication_type          = each.value.account_replication_type
  enable_https_traffic_only         = each.value.enable_https_traffic_only
  min_tls_version                   = each.value.min_tls_version
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {  
  for_each = { for k, v in (var.azurerm_storage_data_lake): v.datalakename => v }
  name               = each.value.datalakename
  storage_account_id = azurerm_storage_account.this[each.value.datalakename].id
}

