# modules/cosmosdb_sql/main.tf

# Creazione dell'account Cosmos DB
resource "azurerm_cosmosdb_account" "this" {
  for_each = var.cosmosdb_accounts

  name                = "${each.value.name}cfc"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"  # Tipo di Cosmos DB (NoSQL/SQL)

  consistency_policy {
    consistency_level = each.value.consistency_level  # Livello di consistenza (es. Strong, Eventual)
  }

  geo_location {
    location          = each.value.geo_location  # Localizzazione geografica
    failover_priority = each.value.failover_priority  # Priorità del failover
  }

  tags = each.value.tags  # Aggiunta di tag se forniti
}

# Creazione del database SQL nel Cosmos DB
resource "azurerm_cosmosdb_sql_database" "this" {
  for_each = var.cosmosdb_databases

  name                =   "${each.value.database_name}_cfc" # Nome del database SQL
  resource_group_name = each.value.resource_group_name  # Resource Group
  account_name        = azurerm_cosmosdb_account.this[each.value.account_key].name  # Collegamento all'account Cosmos DB
}

# Creazione del container SQL nel database Cosmos DB
resource "azurerm_cosmosdb_sql_container" "this" {
  for_each = var.cosmosdb_containers

  name                =   "${each.value.container_name}_cfc"# Nome del container
  resource_group_name = each.value.resource_group_name  # Resource Group
  account_name        = azurerm_cosmosdb_account.this[each.value.account_key].name  # Collegamento all'account Cosmos DB
  database_name       = azurerm_cosmosdb_sql_database.this[each.value.database_key].name  # Collegamento al database Cosmos DB

  partition_key_paths = each.value.partition_key_paths  # Lista di percorsi della chiave di partizione

  # Politica di indicizzazione opzionale
  indexing_policy {
    indexing_mode = each.value.indexing_policy.indexing_mode  # Modalità di indicizzazione (e.g., Consistent, Lazy)
  }
}
