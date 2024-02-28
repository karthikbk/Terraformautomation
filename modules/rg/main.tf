locals {
  location    = var.stack_config.location
  prefix      = var.stack_config.prefix
  environment = var.stack_config.environment
  rg_name     = var.rg.name
}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = local.location

  tags = merge(
    var.global_config.tags,
    var.stack_config.tags,
    var.rg.tags
  )
}
