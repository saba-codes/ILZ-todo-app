data "azurerm_key_vault" "key_vault" {
  for_each = var.vms
  name                = each.value.data_kv_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "user_name" {
  for_each    = var.vms
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
data "azurerm_key_vault_secret" "password" {
  for_each    = var.vms
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
}
data "azurerm_network_interface" "data-nic" {
    for_each = var.vms
  name                = each.value.data_nic_name
  resource_group_name = each.value.resource_group_name
}
