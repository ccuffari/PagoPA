resource_group_name    = "dev-rg-cfc"
# Configurazione Virtual Network
vnet = {
  vnet1 = {
    resource_group_name    = "dev-rg-cfc"
    location               = "Italy North"
    vnet_name              = "vnet-cosmosdb-cfc"
    address_space          = ["10.0.0.0/16"]
    subnet_name            = "subnet-cosmosdb-cfc"
    subnet_address_prefix = ["10.0.1.0/24"]
  }
}

key_vaults = {
  "kv1" = {
    name                = "mykeyvault1-cfc"
    location            = "Italy North"
    resource_group_name = "dev-rg-cfc"
    sku_name             = "standard"
    tags = {
      environment = "dev"
    }
    access_policy = {
      object_id                  = "00000000-0000-0000-0000-000000000000"
      key_permissions            = ["Get", "List"]
      secret_permissions         = ["Get", "List"]
      certificate_permissions    = ["Get", "List"]
      storage_permissions        = ["Get", "List"]
    }
  }
}

tenant_id = "bb1a63eb-eb09-471a-a005-37b07792a5b5"

# Definizione degli account Cosmos DB
cosmosdb_accounts = {
  account1 = {
    name                      = "cosmosdb-account1-cfc"
    location                  = "Italy North"
    resource_group_name       = "dev-rg-cfc"
    consistency_level         = "Strong"
    is_virtual_network_filter_enabled = true
    geo_location              = "Italy North"
    failover_priority         = 0
    tags                      = {
      environment = "dev"
    }
  }
}

# Definizione dei database Cosmos DB SQL
cosmosdb_databases = {
  database1 = {
    database_name       = "db1-cfc"
    resource_group_name = "dev-rg-cfc"
    account_key         = "account1"
  }
}

# Definizione dei container Cosmos DB SQL
# Definizione dei container Cosmos DB SQL
cosmosdb_containers = {
  container1 = {
    container_name      = "container1-cfc"
    resource_group_name = "dev-rg-cfc"
    account_key         = "account1"
    database_key        = "database1"
    partition_key_paths = ["/myPartitionKey1"]
    indexing_policy = {
      indexing_mode = "consistent"  # Corretto in minuscolo
    }
  }
}


# # Valori per gli storage account
# storage_accounts = {
#   storage1 = {
#     name                    = "devstorage1cfc"
#     resource_group_name      = "dev-rg-cfc"
#     location                = "Italy North"
#     account_tier            = "Standard"
#     account_replication_type = "LRS"
#     tags                    = {
#       environment = "dev"
#       project     = "PagoPA"
#     }
#   }
# }

