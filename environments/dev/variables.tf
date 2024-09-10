variable "databases" {
  description = "Lista di database da creare"
  type = map(object({
    account_name       = string
    resource_group_name = string
    location            = string
    consistency_policy  = string
    offer_type          = string
  }))
}

# Variabile opzionale per PostgreSQL
variable "admin_password" {
  description = "Password per l'utente amministratore di PostgreSQL (opzionale)"
  type        = string
  default     = null
}

variable "redis_instances" {
  description = "Lista delle istanze Redis da creare"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    capacity            = number
    family              = string
    sku_name            = string
    enable_non_ssl_port = bool
    minimum_tls_version = string
    tags                = map(string)
  }))
}

variable "storage_accounts" {
  description = "Lista degli storage account da creare"
  type = map(object({
    name                    = string
    resource_group_name      = string
    location                = string
    account_tier            = string
    account_replication_type = string
    tags                    = map(string)
  }))
}

variable "vm_instances" {
  description = "Lista delle istanze di macchine virtuali da creare"
  type = map(object({
    vm_name              = string
    location             = string
    resource_group_name  = string
    subnet_id            = string
    vm_size              = string
    admin_username       = string
    admin_password       = string # Si potrebbe rendere opzionale come in PostgreSQL
    tags                 = map(string)
  }))
}

# Variabile opzionale per PostgreSQL
variable "subscription_id" {
  description = "nome della subscription"
  type        = string
  default     = "ac4d4066-c9a3-48c6-874b-5173f6dfe58f"
}