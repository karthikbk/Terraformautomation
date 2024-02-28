data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}
 
 

locals {
  global_config = var.global_config
  stack_config  = var.stack_config
  rg = {
    name = var.rg.name
    tags = local.tags
  }
}
//********** ResourceGroup ******//
module "rg" {
  source  = "./modules/rg"
  
  global_config = local.global_config
  stack_config  = local.stack_config
  rg            = local.rg
  }

//********** Storage **********//
module "storage" {
  source  = "./modules/storage"
  azurerm_storage_account = var.azurerm_storage_account
  # depends_on = [module.rg]
}

module "StorageADLS" {
  source  = "./modules/StorageADLS"
  azurerm_storage_data_lake = var.azurerm_storage_data_lake
  # depends_on = [module.rg]
}

//*********** Keyvault **********//
module "keyvault" {
  source  = "./modules/keyvault"
  keyvault              = var.keyvault
  keyvaultaccesspolicy  = var.keyvaultaccesspolicy
  depends_on = [module.rg]
}

// ****** ADF Pipeline *******//
module "adf" {
  source  = "./modules/adf"
  azurerm_data_factory =var.azurerm_data_factory 

}



########## Sqlserver #################
module "sqlserver" {
  source  = "./modules/sqlserver"
  primary_blob_endpoint           = var.primary_blob_endpoint
  primary_access_key              = var.primary_access_key
  azure_sqlserver_input           =var.azure_sqlserver_input
  tags                            = var.tags
  depends_on = [
    module.rg
  ]
}


// ********* Role Mapping ********* //

data "azuread_group" "groupname_contributor" {
  display_name = "AZU_C_P0003261_OBH_Contributor"
}

resource "azurerm_role_assignment" "obh_mdc_storage_contributor" {
  scope                = "$"
  role_definition_name = "Contributor"
  principal_id         = data.azuread_group.groupname_contributor_contributor.object_id
}
