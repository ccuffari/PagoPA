# Main.tf per l'ambiente DEV
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_client_config" "current" {}

# module "storage_account" {
#   source = "../../modules/storage_account"
#   storage_accounts = var.storage_accounts
# }

module "vnet" {
  for_each = var.vnet

  source              = "../../modules/vnet"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  vnet_name           = each.value.vnet_name
  address_space       = each.value.address_space
  subnet_name         = each.value.subnet_name
  subnet_address_prefix = each.value.subnet_address_prefix
}

# environment/main.tf

module "key_vault" {
  source = "../../modules/key_vault"

  key_vaults = var.key_vaults
  tenant_id  = var.tenant_id
  soft_delete_enabled = var.soft_delete_enabled
}


# main.tf

module "cosmosdb_sql" {
  source = "../../modules/cosmosdb"

  cosmosdb_accounts  = var.cosmosdb_accounts
  cosmosdb_databases = var.cosmosdb_databases
  cosmosdb_containers = var.cosmosdb_containers
}
