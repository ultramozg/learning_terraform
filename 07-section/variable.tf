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
  default = "dev"
}

variable "service_bus" {
  description = "this variable hold all information about service bus itself and queues"
  type = object({
    name   = string
    queues = map(any)
  })

  default = {
    name = "test-service-bus-dev"
    queues = {
      fist-queue = {
        max_size = 1024
        lock_duration = "PT1M"
        max_delivery_count = 10
        enable_partitioning = false
      }
      second-queue = {
        max_size = 1024
        lock_duration = "PT1M"
        max_delivery_count = 10
        enable_partitioning = false
      }
    }
  }
}