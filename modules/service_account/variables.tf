variable "service_accounts" {
  description = "Mapping of service accounts to create"
  type = map(object({
    application_id = string
    password       = string  # Ora è incluso, anche se non verrà usato
    end_date       = string
  }))
}
