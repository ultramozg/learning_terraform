module "service_bus" {
  source      = "./service_bus"

  rg_name     = "dev-rg"
  environment = "dev"

  geo_recovery = {
    enabled  = true
    capacity = 1
  }
  sku = "Premium"

  service_bus = {
    name = "ssh-dev-service-bus"
    queues = {
      test-queue = {
        max_size = 1024
        lock_duration = "PT1M"
        max_delivery_count = 10
        enable_partitioning = false
      }
    }
  }
}