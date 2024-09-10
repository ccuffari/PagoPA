# output "cosmosdb_accounts" {
#   value = {
#     for db in azurerm_cosmosdb_account.db : db.name => db.endpoint
#   }
# }

# output "postgresql_servers" {
#   value = {
#     for pg in azurerm_postgresql_server.postgresql : pg.name => pg.fqdn
#   }
# }
