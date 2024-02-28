
variable "azurerm_storage_data_lake" {
  description = "multiple azurerm_ADLSstorage_account create"
  type = map(object({
    storagename                = string
    resource_group_name        = string
    datalakename               = string
    tags                       = map(string)
    account_tier               = string
    account_kind               = string
    account_replication_type   = string
    enable_https_traffic_only  = string
    min_tls_version            = string
    location                   = string
  }))
}
