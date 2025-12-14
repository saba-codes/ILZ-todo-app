data "azurerm_mssql_server" "dataserver" {
    for_each = var.mssql_databases
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_mssql_database" "sql_db" {
    for_each    = var.mssql_databases
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.dataserver[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = each.value.tags
}