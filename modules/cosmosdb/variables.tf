# modules/cosmosdb_sql/variables.tf

# Variabile per definire gli account Cosmos DB da creare
variable "cosmosdb_accounts" {
  description = "A map of Cosmos DB accounts to be created"
  type = map(object({
    name                      = string                  # Nome dell'account Cosmos DB
    location                  = string                  # Localizzazione dell'account Cosmos DB
    resource_group_name       = string                  # Nome del Resource Group in cui creare l'account
    consistency_level         = string                  # Livello di consistenza (es. Strong, Eventual)
    is_virtual_network_filter_enabled = bool            # Se abilitare il filtro di rete virtuale
    geo_location              = string                  # Localizzazione geografica (es. East US, West Europe)
    failover_priority         = number                  # Priorità del failover (0 per la prima posizione)
    tags                      = map(string)             # Tag associati all'account
  }))
}

# Variabile per definire i database Cosmos DB SQL da creare
variable "cosmosdb_databases" {
  description = "A map of Cosmos DB SQL databases to be created"
  type = map(object({
    database_name      = string  # Nome del database Cosmos DB
    resource_group_name = string  # Nome del Resource Group
    account_key        = string  # Chiave per collegare il database all'account Cosmos DB
  }))
}

# Variabile per definire i container Cosmos DB SQL da creare
variable "cosmosdb_containers" {
  description = "A map of Cosmos DB SQL containers to be created"
  type = map(object({
    container_name     = string  # Nome del container
    resource_group_name = string  # Nome del Resource Group
    account_key        = string  # Chiave per collegare il container all'account Cosmos DB
    database_key       = string  # Chiave per collegare il container al database Cosmos DB
    partition_key_paths = list(string)  # Lista dei percorsi della chiave di partizione
    indexing_policy    = object({
      indexing_mode = string  # Modalità di indicizzazione (e.g., Consistent, Lazy)
    })
  }))
}
