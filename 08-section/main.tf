module "service_bus" {
  source      = "./service_bus"

  rg_name     = "dev-rg"
  environment = "dev"

  // Geo-Recovery only works with Premium sku
  geo_recovery = {
    enabled  = true
    // When we choose the Premium sku plan by default it 1,
    // but we should provide this value anyway.
    capacity = 1
  }

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