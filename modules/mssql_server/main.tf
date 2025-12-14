resource "azurerm_mssql_server" "server" {
    for_each = var.mssql_servers
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "H@Sh1CoR3!"
  minimum_tls_version          = "1.2"

  tags = {
    environment = "production"
  }
}