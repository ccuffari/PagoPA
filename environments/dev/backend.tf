terraform {
  backend "azurerm" {
    resource_group_name   = "cfc-dev-rg-pagopa"
    storage_account_name  = "cfcdevsapagopa"
    container_name        = "cfc-dev-tfstate-pagopa"
    key                   = "terraform.tfstate"
  }
}
