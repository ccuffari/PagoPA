terraform {
  backend "azurerm" {
    resource_group_name   = "rg-dev"
    storage_account_name  = "storageaccountdevcfc"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
