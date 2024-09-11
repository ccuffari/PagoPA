# # modules/cosmosdb/outputs.tf
# output "cosmosdb_account_ids" {
#   value = { for k, v in azurerm_cosmosdb_account.cosmos : k => v.id }
# }

# output "cosmosdb_account_endpoints" {
#   value = { for k, v in azurerm_cosmosdb_account.cosmos : k => v.endpoint }
# }