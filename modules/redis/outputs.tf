# output "redis_hostnames" {
#   value = { for k, v in azurerm_redis_cache.redis : k => v.hostname }
# }

# output "redis_primary_keys" {
#   value = { for k, v in azurerm_redis_cache.redis : k => v.primary_access_key }
# }
