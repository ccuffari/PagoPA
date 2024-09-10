# Valori per le istanze Redis
redis_instances = {
  redis1 = {
    name                = "dev-redis1"
    location            = "West Europe"
    resource_group_name = "dev-rg-cfc"
    capacity            = 2
    family              = "C"
    sku_name            = "Standard"
    enable_non_ssl_port = false
    minimum_tls_version = "1.2"
    tags                = {
      environment = "dev"
      project     = "PagoPA"
    }
  },
  redis2 = {
    name                = "dev-redis2"
    location            = "West Europe"
    resource_group_name = "dev-rg-cfc"
    capacity            = 2
    family              = "C"
    sku_name            = "Standard"
    enable_non_ssl_port = false
    minimum_tls_version = "1.2"
    tags                = {
      environment = "dev"
      project     = "PagoPA"
    }
  }
}

# Valori per gli storage account
storage_accounts = {
  storage1 = {
    name                    = "devstorage1cfc"
    resource_group_name      = "dev-rg-cfc"
    location                = "West Europe"
    account_tier            = "Standard"
    account_replication_type = "LRS"
    tags                    = {
      environment = "dev"
      project     = "PagoPA"
    }
  },
  storage2 = {
    name                    = "devstorage2cfc"
    resource_group_name      = "dev-rg-cfc"
    location                = "West Europe"
    account_tier            = "Standard"
    account_replication_type = "LRS"
    tags                    = {
      environment = "dev"
      project     = "PagoPA"
    }
  },
  storage3 = {
    name                    = "devstorage3cfc"
    resource_group_name      = "dev-rg-cfc"
    location                = "West Europe"
    account_tier            = "Standard"
    account_replication_type = "LRS"
    tags                    = {
      environment = "dev"
      project     = "PagoPA"
    }
  }
}


# Valori per le macchine virtuali
vm_instances = {
  vm1 = {
    vm_name              = "dev-vm1"
    location             = "West Europe"
    resource_group_name  = "dev-rg-cfc"
    subnet_id            = "/subscriptions/<subscription_id>/resourceGroups/dev-rg-cfc/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/dev-subnet"
    vm_size              = "Standard_B2ms"
    admin_username       = "adminuser"
    admin_password       = "P@ssw0rd!"
    tags = {
      environment = "dev"
      project     = "PagoPA"
    }
  },
  vm2 = {
    vm_name              = "dev-vm2"
    location             = "West Europe"
    resource_group_name  = "dev-rg-cfc"
    subnet_id            = "/subscriptions/<subscription_id>/resourceGroups/dev-rg-cfc/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/dev-subnet"
    vm_size              = "Standard_B2ms"
    admin_username       = "adminuser"
    admin_password       = "P@ssw0rd!"
    tags = {
      environment = "dev"
      project     = "PagoPA"
    }
  }
}

# Valori per i database Cosmos DB e PostgreSQL
databases = {
  cosmos1 = {
    account_name        = "dev-cosmos1"
    location            = "West Europe"
    resource_group_name = "dev-rg-cfc"
    offer_type          = "Standard"
    consistency_policy  = "Session"
    tags = {
      environment = "dev"
      project     = "PagoPA"
    }
  },
  postgres1 = {
    account_name        = "dev-postgres1"
    location            = "West Europe"
    resource_group_name = "dev-rg-cfc"
    offer_type          = "GP_Gen5"
    consistency_policy  = "Session"
    admin_password      = "P@ssw0rd!"
    tags = {
      environment = "dev"
      project     = "PagoPA"
    }
  }
}
