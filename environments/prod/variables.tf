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
