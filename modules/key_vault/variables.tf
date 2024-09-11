# modules/key_vault/variables.tf

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
