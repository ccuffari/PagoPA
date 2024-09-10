resource "azurerm_network_interface" "vm_nic" {
  for_each            = var.vm_instances
  name                = "${each.value.vm_name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  for_each               = var.vm_instances
  name                   = each.value.vm_name
  location               = each.value.location
  resource_group_name    = each.value.resource_group_name
  network_interface_ids  = [azurerm_network_interface.vm_nic[each.key].id]
  vm_size                = each.value.vm_size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${each.value.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value.vm_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = each.value.tags
}
