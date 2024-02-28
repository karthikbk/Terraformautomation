variable "azurerm_storage_account" {
  description = "multiple azurerm_storage_account create"
  type = map(object({
    resource_group_name        = string
    name                       = string
    tags                       = map(string)
    account_tier               = string
    account_kind               = string
    account_replication_type   = string
    enable_https_traffic_only  = string
    min_tls_version            = string
    location                   = string
  }))
}
