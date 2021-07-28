variable "rg_name" {
  type    = string
  default = "test-rg-name"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "environment" {
  type    = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "service_bus" {
  description = "this variable hold all information about the service bus itself and queues"
  type = object({
    name   = string
    queues = map(any)
  })
}