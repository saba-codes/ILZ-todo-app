module "resource_group" {
  source          = "../../modules/rg"
  resource_groups = var.resource_groups
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnet       = var.vnet
}

module "pip" {
  depends_on = [module.resource_group]
  source     = "../../modules/pip"
  pip        = var.pip
}
module "nic" {
  depends_on = [module.vnet, module.pip]
  source     = "../../modules/nic"
  nic        = var.nic
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/key_vault"
  key_vault  = var.key_vault
}

module "vm" {
  depends_on = [module.nic, module.key_vault]
  source     = "../../modules/vms"
  vms        = var.vms
}

module "mssql_server" {
  depends_on    = [module.resource_group]
  source        = "../../modules/mssql_server"
  mssql_servers = var.mssql_servers
}
module "mssql_database" {
  depends_on      = [module.mssql_server]
  source          = "../../modules/mssql_database"
  mssql_databases = var.mssql_databases
}
module "nsg" {
  depends_on = [module.resource_group]
  source     = "../../modules/nsg"
  nsg        = var.nsg
}




