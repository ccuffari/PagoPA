# Creazione dell'account Cosmos DB
resource "azurerm_cosmosdb_account" "db" {
  for_each = var.databases

  name                = each.value.account_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  offer_type          = each.value.offer_type

  consistency_policy {
    consistency_level = each.value.consistency_policy
  }

  geo_location {
    location          = each.value.location
    failover_priority = 0
  }
}

# Creazione opzionale del PostgreSQL Server
resource "azurerm_postgresql_server" "postgresql" {
  for_each = var.databases

  name                = "${each.value.account_name}-pg"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  administrator_login = "adminuser"
  administrator_login_password = var.admin_password != null ? var.admin_password : "default_password"
  version             = "12"
  sku_name            = "GP_Gen5_2"
  ssl_enforcement_enabled = ""

#   storage_profile {
#     storage_mb            = 5120
#     backup_retention_days = 7
#     geo_redundant_backup  = "Enabled"
#   }
}
