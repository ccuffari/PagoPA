variable "location" {
 description = "value"
 type = string
 default = "Italy North"
}

# variable "storage_accounts" {
#   description = "Lista degli storage account da creare"
#   type = map(object({
#     name                    = string
#     resource_group_name      = string
#     location                = string
#     account_tier            = string
#     account_replication_type = string
#     tags                    = map(string)
#   }))
# }

# Variabile opzionale per PostgreSQL
variable "subscription_id" {
  description = "nome della subscription"
  type        = string
  default     = "ac4d4066-c9a3-48c6-874b-5173f6dfe58f"
}

# variables.tf
variable "resource_group_name" {
  type        = string
  description = "Nome del resource group esistente"
  default     = "cfc-dev-rg-pagopa"
}

variable "resource_group_location" {
  type        = string
  description = "Location del resource group esistente"
  default = "Italy North"
}

variable "vnet" {
  description = "A map of Virtual Networks to be created"
  type = map(object({
    resource_group_name = string
    location            = string
    name                = string
    address_space       = list(string)
  }))
}

variable "subnet" {
  description = "A map of Subnets to be created"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "service_accounts" {
  description = "Mapping of service accounts to create"
  type = map(object({
    application_id = string
    password       = string
    end_date       = string
  }))
}



# environment/variables.tf

variable "key_vaults" {
  description = "A map of key vaults to be created"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name             = string
    tags                = map(string)
    access_policy       = object({
      object_id                  = string
      key_permissions            = list(string)
      secret_permissions         = list(string)
      certificate_permissions    = list(string)
      storage_permissions        = list(string)
    })
  }))
}

variable "tenant_id" {
  description = "The tenant ID for the Key Vault"
  type        = string
}

variable "soft_delete_enabled" {
  description = "Enable or disable soft delete"
  type        = bool
  default     = true
}

# variables.tf

variable "cosmosdb_accounts" {
  description = "Map of Cosmos DB accounts to be created"
  type        = map(object({
    name                      = string
    location                  = string
    resource_group_name       = string
    consistency_level         = string
    is_virtual_network_filter_enabled = bool
    geo_location              = string
    failover_priority         = number
    tags                      = map(string)
  }))
}

variable "cosmosdb_databases" {
  description = "Map of Cosmos DB SQL databases to be created"
  type        = map(object({
    database_name       = string
    resource_group_name = string
    account_key         = string
  }))
}

variable "cosmosdb_containers" {
  description = "Map of Cosmos DB SQL containers to be created"
  type        = map(object({
    container_name      = string
    resource_group_name = string
    account_key         = string
    database_key        = string
    partition_key_paths = list(string)
    indexing_policy     = object({
      indexing_mode = string
    })
  }))
}
