resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.value.vms_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.user_name[each.key].value
  admin_password      = data.azurerm_key_vault_secret.password[each.key].value
  custom_data         = base64encode(file("${path.module}/nginx.sh"))

  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.data-nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}