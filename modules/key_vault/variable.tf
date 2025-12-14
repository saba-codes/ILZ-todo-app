variable "key_vault" {
  type = map(object({
    kv_name              = string
    location             = string
    resource_group_name  = string
    data_kv_name         = string
  }))
}