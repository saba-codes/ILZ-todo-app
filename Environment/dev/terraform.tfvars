resource_groups = {
  rg1 = {
    name     = "dev-rg-1"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    vnet_name           = "dev-vnet-1"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    address_space       = ["10.0.0.0/16"]

    subnets = [
      {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

nic = {
  nic1 = {
    nic_name            = "dev-nic-1"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    vnet_name           = "dev-vnet-1"
    data_subnet_name    = "subnet1"
    data_pip_name       = "dev-pip-1"
  }
  nic2 = {
    nic_name            = "dev-nic-2"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    vnet_name           = "dev-vnet-1"
    data_subnet_name    = "subnet2"
    data_pip_name       = "dev-pip-2"
  }
}

key_vault = {
  kv1 = {
    kv_name             = "dev-kv-brosa"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    data_kv_name        = "dev-kv-1"
  }
}

vms = {
  vm1 = {
    vms_name            = "frontend-vm-1"
    size                = "Standard_B2s"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    data_kv_name        = "dev-kv-brosa"
    data_nic_name       = "dev-nic-1"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
  vm2 = {
    vms_name            = "backend-vm-2"
    size                = "Standard_B2s"
    location            = "centralindia"
    resource_group_name = "dev-rg-1"
    data_kv_name        = "dev-kv-brosa"
    data_nic_name       = "dev-nic-2"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
}


pip = {
  pip1 = {
    name                = "dev-pip-1"
    resource_group_name = "dev-rg-1"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "production"
    }
  }
  pip2 = {
    name                = "dev-pip-2"
    resource_group_name = "dev-rg-1"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "production"
    }
  }
}

mssql_servers = {
  mssql1 = {
    name                = "dev-mssql-server-brosa"
    resource_group_name = "dev-rg-1"
    location            = "northeurope"
  }

}

mssql_databases = {
  db1 = {
    name                = "dev-sql-db-1"
    server_name         = "dev-mssql-server-brosa"
    resource_group_name = "dev-rg-1"
    max_size_gb         = 10
    tags = {
      environment = "production"
    }
  }
  db2 = {
    name                = "dev-sql-db-2"
    server_name         = "dev-mssql-server-brosa"
    resource_group_name = "dev-rg-1"
    max_size_gb         = 20
    tags = {
      environment = "production"
    }
  }
}
nsg = {
  nsg1 = {
    nsg_name                   = "dev-nsg-1"
    location                   = "centralindia"
    resource_group_name        = "dev-rg-1"
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  nsg2 = {
    nsg_name                   = "dev-nsg-2"
    location                   = "centralindia"
    resource_group_name        = "dev-rg-1"
    name                       = "allow-rdp"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}






