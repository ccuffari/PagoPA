resource "azurerm_redis_cache" "redis" {
  for_each            = var.redis_instances
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  capacity            = each.value.capacity
  family              = each.value.family
  sku_name            = each.value.sku_name

  minimum_tls_version = each.value.minimum_tls_version

  tags = each.value.tags
}
