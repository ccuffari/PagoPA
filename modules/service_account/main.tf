resource "azuread_service_principal" "service_accounts" {
  for_each = var.service_accounts

  application_id = each.value["application_id"]
}

resource "azuread_service_principal_password" "sp_password" {
  for_each = var.service_accounts

  service_principal_id = azuread_service_principal.service_accounts[each.key].id
  end_date             = each.value["end_date"] # Optional, or set to `null`
}
