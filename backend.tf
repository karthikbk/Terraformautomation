# terraform {
#   backend "azurerm" {}
# }

provider "azurerm" {
  features {
    
  }
  skip_provider_registration = "true"
}

# azurerm = {
# source = "hashicorp/azurerm"
# version = "~> 2.90.0"
# }

# provider "azurerm" {
#   skip_provider_registration = "true"
# }