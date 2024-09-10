# output "vm_ids" {
#   value = { for k, v in azurerm_virtual_machine.vm : k => v.id }
# }

# output "vm_private_ips" {
#   value = { for k, v in azurerm_network_interface.vm_nic : k => v.private_ip_address }
# }
