# modules/key_vault/main.tf

resource "azurerm_key_vault" "kv" {
  for_each = var.key_vaults

  name                = "${each.value.name}cfc"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name             = each.value.sku_name
  tenant_id            = var.tenant_id

  tags = each.value.tags
}

resource "azurerm_key_vault_access_policy" "kv_a_p" {
  for_each = var.key_vaults

  key_vault_id = azurerm_key_vault.kv[each.key].id

  tenant_id = var.tenant_id
  object_id = each.value.access_policy.object_id

  key_permissions = each.value.access_policy.key_permissions
  secret_permissions = each.value.access_policy.secret_permissions
  certificate_permissions = each.value.access_policy.certificate_permissions
  storage_permissions = each.value.access_policy.storage_permissions
}


