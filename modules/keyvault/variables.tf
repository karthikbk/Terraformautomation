variable "keyvault" {
  description = "multiple keyvault create"
  type = map(object({
    resource_group_name        = string
    name                       = string
    location                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    sku_name                   = string
    tags                       = map(string)

  }))
}
variable "keyvaultaccesspolicy" {
  description = "multiple keyvaultaccesspolicy create"
  type = map(object({   
    keyvaultname               = string
    object_id                  = string
    key_permissions            = list(string)
    secret_permissions         = list(string)
    certificate_permissions    = list(string)
    
  }))
}
