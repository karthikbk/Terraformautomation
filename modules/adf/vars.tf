variable "azurerm_data_factory" {
  description = "Multiple group name create"
  type = map(object({
    name        = string
    location    = string
    resource_group_name  =string
    gitaccount_name  = string
    gitbranch_name  = string
    git_url  = string
    gitrepository_name  = string
    gitroot_folder  = string
  
  }))
}
