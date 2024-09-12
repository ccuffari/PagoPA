output "service_principal_ids" {
  description = "The IDs of the created service principals"
  value       = { for k, v in azuread_service_principal.service_accounts : k => v.id }
}
