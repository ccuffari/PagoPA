variable "redis_instances" {
  description = "A map of Redis instances to be created"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    capacity            = number
    family              = string
    sku_name            = string
    enable_non_ssl_port = bool
    minimum_tls_version = string
    tags                = map(string)
  }))
}
