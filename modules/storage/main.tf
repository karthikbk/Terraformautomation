
resource "azurerm_storage_account" "this" {
  for_each = { for k, v in (var.azurerm_storage_account): v.name => v }
  name                              = each.value.name
  tags                              = each.value.tags
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  account_tier                      = each.value.account_tier
  account_kind                      = each.value.account_kind
  account_replication_type          = each.value.account_replication_type
  enable_https_traffic_only         = each.value.enable_https_traffic_only
  min_tls_version                   = each.value.min_tls_version
  # network_rules {
  #     default_action             = "deny"
  #   }
}

output "obj" {
  value = azurerm_storage_account.this 
}
