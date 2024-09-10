# output "storage_account_names" {
#   value = { for k, v in azurerm_storage_account.storage : k => v.name }
# }

# output "storage_account_connection_strings" {
#   value = { for k, v in azurerm_storage_account.storage : k => v.primary_connection_string }
# }
