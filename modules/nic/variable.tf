variable "nic" {
  type = map(object({
    nic_name              = string
    location              = string
    resource_group_name   = string
    vnet_name             = string
    data_subnet_name      = string
    data_pip_name         = string
  }))
}