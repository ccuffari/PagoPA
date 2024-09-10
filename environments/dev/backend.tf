terraform {
  backend "azurerm" {
    resource_group_name   = "dev-rg-cfc"
    storage_account_name  = "storageaccountdevcfc"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
