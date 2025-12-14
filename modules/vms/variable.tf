variable "vms" {
  type = map(object({
    vms_name              = string
    size                  = string
    location              = string
    resource_group_name   = string
    data_nic_name        = string
    data_kv_name         = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}