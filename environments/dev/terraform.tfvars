vnet = {
  vnet1 = {
    resource_group_name = "cfc-dev-rg-pagopa"
    location            = "Italy North"
    name                = "vnet-cosmosdb"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet-cosmosdb"
    resource_group_name  = "cfc-dev-rg-pagopa"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}


key_vaults = {
  "kv1" = {
    name                = "cfcdevvaultpagopa"
    location            = "Italy North"
    resource_group_name = "cfc-dev-rg-pagopa"
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
    name                      = "dev-cosmosdb-account1-pagopa"
    location                  = "Italy North"
    resource_group_name       = "cfc-dev-rg-pagopa"
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
    database_name       = "dev-db1-pagopa"
    resource_group_name = "cfc-dev-rg-pagopa"
    account_key         = "account1"
  }
}

# Definizione dei container Cosmos DB SQL
# Definizione dei container Cosmos DB SQL
cosmosdb_containers = {
  container1 = {
    container_name      = "dev-container1-pagopa"
    resource_group_name = "cfc-dev-rg-pagopa"
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
#     name                    = "devstorage1pagopa"
#     resource_group_name      = "cfc-dev-rg-pagopa"
#     location                = "Italy North"
#     account_tier            = "Standard"
#     account_replication_type = "LRS"
#     tags                    = {
#       environment = "dev"
#       project     = "PagoPA"
#     }
#   }
# }

