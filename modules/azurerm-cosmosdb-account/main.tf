resource "azurerm_cosmosdb_account" "this" {
  kind                 = var.kind
  location             = var.location
  mongo_server_version = var.mongo_server_version
  name                 = var.name
  offer_type           = "Standard"
  resource_group_name  = var.resource_group_name
  tags                 = var.tags


  dynamic "capabilities" {
    # If capabilities is not defined, do not create
    for_each = var.capabilities != null ? var.capabilities : []

    content {
      name = capabilities.value.name
    }
  }

  dynamic "consistency_policy" {
    # If consistency_policy is not defined, do not create
    for_each = var.consistency_policy != null ? var.consistency_policy : []

    content {
      consistency_level       = consistency_policy.value.consistency_level
      max_interval_in_seconds = consistency_policy.value.max_interval_in_seconds
      max_staleness_prefix    = consistency_policy.value.max_staleness_prefix
    }
  }

  dynamic "geo_location" {
    # If geo_location is not defined, do not create
    for_each = var.geo_location != null ? var.geo_location : []

    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = geo_location.value.zone_redundant
    }
  }
}
