variable "vnet" {
  description = "A map of Virtual Networks to be created"
  type = map(object({
    resource_group_name = string
    location            = string
    name                = string
    address_space       = list(string)
  }))
}

variable "subnet" {
  description = "A map of Subnets to be created"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
