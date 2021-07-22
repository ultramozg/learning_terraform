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
        "param1" = "pampam"
        "param2" = "pampam"
      }
      second-queue = {
        "param1" = "pampam"
        "param2" = "pampam"
      }
    }
  }
}