resource "azurerm_user_assigned_identity" "this" {
  for_each = { for k, v in (var.azurerm_data_factory): v.name => v }
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}
resource "azurerm_data_factory" "this" {
  for_each = { for k, v in (var.azurerm_data_factory): v.name => v }
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  github_configuration {
    account_name    = each.value.gitaccount_name
    branch_name     = each.value.gitbranch_name
    git_url         = each.value.git_url
    repository_name = each.value.gitrepository_name
    root_folder     = each.value.gitroot_folder
  } 
  identity{
    type ="UserAssigned"
    identity_ids=[  "${azurerm_user_assigned_identity.this[each.value.name].id}"  ]
  }
}

output "obj" {
  value = {
    for k, v in azurerm_data_factory.this : k => v.id
  }
  depends_on = [azurerm_data_factory.this]
}