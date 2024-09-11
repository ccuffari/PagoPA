resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet
  name     = "${each.value.name}_cfc"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name                 = "${each.value.name}_cfc"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.virtual_network_name].name
  address_prefixes     = each.value.address_prefixes
}
