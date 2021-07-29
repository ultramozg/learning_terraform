variable "rg_name" {
  type    = string
  default = "test-rg-name"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "failover_location" {
  type = string
  default = "ukwest"
}

variable "environment" {
  type    = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "geo_recovery" {
  type = object({
    enabled  = bool
    capacity = number
  })
  default = {
    enabled  = false
    capacity = 1
  }
  description = "If you enable the failover location "
}

variable "service_bus" {
  description = "this variable hold all information about the service bus itself and queues"
  type = object({
    name   = string
    queues = map(any)
  })
}