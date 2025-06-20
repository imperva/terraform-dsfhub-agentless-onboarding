terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

module "cosmos-mongo-account" {
  source = "../azurerm-cosmosdb-account"

  capabilities         = var.cosmosdb_account_capabilities
  consistency_policy   = var.cosmosdb_account_consistency_policy
  geo_location         = var.cosmosdb_account_geo_location
  ip_range_filter      = var.cosmosdb_account_ip_range_filter
  kind                 = "MongoDB"
  location             = var.cosmosdb_account_location
  mongo_server_version = var.cosmosdb_account_mongo_server_version
  name                 = var.cosmosdb_account_name
  resource_group_name  = var.cosmosdb_account_resource_group_name
  tags                 = var.cosmosdb_account_tags
}

# Allow time for the diagnostic setting to be destroyed before destroying the Cosmos DB account
# to prevent destruction issue with exclusive lock on the service
# If experiencing status 412 "PreconditionFailed", increase the destroy_duration
resource "time_sleep" "wait" {
  depends_on = [module.cosmos-mongo-account]

  destroy_duration = "90s"
}

module "diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  depends_on = [resource.time_sleep.wait]

  enabled_log = [
    { category = "MongoRequests" },
    { category = "ControlPlaneRequests" }
  ]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = var.diagnostic_setting_storage_account_id
  target_resource_id             = module.cosmos-mongo-account.this.id
}

module "azure-cosmosdb-mongo-asset" {
  source = "../dsfhub-azure-cosmosdb-mongo"

  admin_email               = var.azure_cosmosdb_mongo_admin_email
  asset_display_name        = module.cosmos-mongo-account.this.name
  asset_id                  = module.cosmos-mongo-account.this.id
  audit_pull_enabled        = var.azure_cosmosdb_mongo_audit_pull_enabled
  gateway_id                = var.azure_cosmosdb_mongo_gateway_id
  logs_destination_asset_id = var.azure_cosmosdb_mongo_logs_destination_asset_id
  server_host_name          = regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-mongo-account.this.endpoint).hostname
  server_port               = regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-mongo-account.this.endpoint).port
}
