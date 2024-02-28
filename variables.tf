variable "environment_prefix" {}
variable "tenant" {}
variable "location"{}
variable "global_config" {
  description = "The global cnfiguration settings"
  type        = any
}

variable "stack_config" {
  description = "stack configuration:  prefix and environment"
  type        = any
}
variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}
variable "rg" {
  description = "resource group object name and tags"
  type = object({
    name = string
    tags = map(string)
  })
}

variable "azurerm_storage_account" {
  description = "Multiple azurerm_storage_account create"
  type        = map
  default     = {
    storage1= {
      name                          = "???"
      resource_group_name           = "???"
      location                      = "eastus2"
      account_tier                  = "Standard"
      account_kind                  = "StorageV2"
      account_replication_type      = "LRS"
      min_tls_version               = "TLS1_0"
      enable_https_traffic_only     = true
      enable_advanced_threat_protection = true 
      tags= {
          Approver            = "devops"
        }
          
    }

  }
}


variable "azurerm_storage_data_lake" {
  description = "Multiple azurerm_storage_account create"
  type        = map
  default     = {
    storage1= {
      datalakename                  = ""
      storagename                   = ""
      resource_group_name           = ""
      location                      = "eastus2"
      account_tier                  = "Standard"
      account_kind                  = "StorageV2"
      account_replication_type      = "LRS"
      min_tls_version               = "TLS1_0"
      enable_https_traffic_only     = true
      enable_advanced_threat_protection = true 
      tags= {
          Approver            = ""
        }
          
    }

  }
}

variable "keyvault" {
  description = "keyvault"
  type        = map
  default     = {
    obhdp-kv-prod = {
      name ="IZDL-keyvault"
      location="eastus2" 
      resource_group_name =""
      purge_protection_enabled =false
      soft_delete_retention_days =7
      sku_name = "standard"
      tags= {
          Approver            = ""
          Business            = "Shared Services"
          Business_Unit       = "Security"
          Data_Classification = "Internal Only"
          Environment         = "Prod"
          Finance             = ""
          Location            = "eastus2"
          Organization        = ""
          Owner               = ""
          Project             = ""
          Team                = ""
      }   
    }
  }
}

variable "keyvaultaccesspolicy" {
  description = "Multiple keyvaultaccesspolicy create"
  type        = map
  default     = {
    kbojja1 = {
      object_id    = ""
      keyvaultname    = "IZDL-keyvault"
      key_permissions =  ["get","list","update","create","import","delete",]
      secret_permissions = [ "get","list","set","delete",]
      certificate_permissions =  ["create","delete","deleteissuers","get","getissuers","import","list"]    
    },
    sbanda23 = {
      object_id    = ""
      keyvaultname    = "IZDL-keyvault"
      key_permissions = ["get","list","update","create","import","delete"]
      secret_permissions = [ "get","list","set","delete"]
      certificate_permissions = ["create","delete","deleteissuers","get","getissuers","import","list"] 
    }
  }
}

variable "azurerm_key_vault_secret" {
  description = "multiple azurerm_key_vault_secret create"
   default     = {
    val1= {
      keyvaultname                     = ""
      keyvaultresource_group_name      = ""
      secretname                       = ""
      secretvalue                      = ""
    }
  }
}
variable "azurerm_key_vault_key" {
  description = "multiple azurerm_key_vault_key create"
   default     = {
    val1= {
      keyvaultname                     = ""
      keyvaultresource_group_name      = ""
      keyvaultkeyname                  = ""
      keyvaultkey_type                 = "RSA"
      keyvaultkey_size                 = 2048
      keyvaultkey_opts                 = [ "decrypt", "encrypt", "sign","unwrapKey"]
    }
  }
}



variable "azurerm_data_factory" {
  description = "Multiple azurerm_data_factory"
  type        = map
  default     = {
    factory1= {
          name        = ""
          location    = "eastus2"
          resource_group_name = ""
          #virtual_network_name  = ""
          gitaccount_name  = "IZDL"
          gitbranch_name  = "master"
          git_url  = "https://github.XXXX.com"
          gitrepository_name  = "NAMEOFREPO"
          gitroot_folder  = "/"
          
    }
  }
}

variable "storage_account_subnet" {
  description = "multiple azurerm_key_vault_key create"
  default     = {
    val1= {
      subnetname                             = "app-subnet"
      virtual_networkresource_group_name     = ""
      #virtual_network_name                   = "obh-prod-core"
      storage_account_resource_group_name    = ""
      storage_account_name                   = "IZCDDEVSTORAGE"
      default_action                         = "Allow"
      bypass                                 = ["Metrics"]
    }
  }
}


 
  variable "private_endpoint_datafactory" {
  description = "private_endpoint_datafactory"
  type        = map
  default     = {
    df1= {
    subnetname                      = "app-subnet"
    virtual_network_name            = ""
    virtual_network_resource_group_name= ""
    datafactoryresource_group_name = ""
    datafactoryname                = ""
    name                           = ""
    location                       = "EastUS2"
    resource_group_name            = "" 
    }
  }
}
  variable "private_endpoint_storage" {
  description = "private_endpoint_storage"
  type        = map
  default     = {
    storageendpoint1= {
     subnetname                            = "app-subnet"
    virtual_network_name                   = ""
    virtual_network_resource_group_name    = ""
    stoargeaccountresource_group_name      = ""
    stoargeaccountname                     = ""
    name                                   = ""
     location                              = "EastUS2"
    resource_group_name                    = "prod-obh-rg"     
    }
  }
}

variable "azurerm_user_assigned_identity" {
  description = "azurerm_user_assigned_identity"
  type        = map
  default     = {
    azurerm_user_assigned_identity1= {
     name                                  = ""
     location                              = "EastUS2"
     resource_group_name                    = ""

    }
  }
}
variable "aad_admin_group_object_ids" {
  description = "aad_admin_group_object_ids"
  type        = map
  default     = {
    azurerm_user_assigned_identity1= {
     name                                  = ""
     location                              = "EastUS2"
     resource_group_name                    = ""
          
    }
  }
}
variable "adf_identity_roleassign" {
  description = "adf_identity_roleassign"
  type        = map
  default     = {
    rbac= {
     
    datafactoryname= ""
    datafactoryresource_group_name=""
    role_definition_name ="Contributor"
    storageaccountresource_group_name =""
    storageaccountname=""        
    }
  }
}



variable "azure_sqlserver_input" {

  type =map
  default = {
    sqlserver1={ 
    resource_group_name=""
    location="eastus2"
    sqlserver_name=""
    sqlversion="12.0"
    administrator_login=""
    administrator_login_password=""

    }
  }
}
variable "primary_blob_endpoint" {
  type=string
  default=""
}
variable "primary_access_key" {
  type=string
  default=""
}


