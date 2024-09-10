# Main.tf per l'ambiente DEV

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# module "redis" {
#   source = "../.../../modules/redis"
#   redis_instances = var.redis_instances
# }

module "storage_account" {
  source = "../../modules/storage_account"
  storage_accounts = var.storage_accounts
}

# module "virtual_machine" {
#   source = "../../modules/virtual_machine"
#   vm_instances = var.vm_instances
# }

# module "database" {
#   source = "/modules/database"
#   databases = var.databases
# }
