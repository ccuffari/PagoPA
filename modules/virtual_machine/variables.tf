variable "vm_instances" {
  description = "A map of VM instances to be created"
  type = map(object({
    vm_name             = string
    location            = string
    resource_group_name = string
    vm_size             = string
    subnet_id           = string
    admin_username      = string
    admin_password      = string
    tags                = map(string)
  }))
}
