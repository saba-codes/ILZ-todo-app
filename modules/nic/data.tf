data "azurerm_subnet" "data-subnet" {
  for_each = var.nic
  name                 = each.value.data_subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each = var.nic
  name                = each.value.data_pip_name
  resource_group_name = each.value.resource_group_name
}