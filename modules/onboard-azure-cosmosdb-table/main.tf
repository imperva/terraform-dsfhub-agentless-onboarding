terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

module "cosmos-table-account" {
  source = "../azurerm-cosmosdb-account"

  capabilities        = var.cosmosdb_account_capabilities
  consistency_policy  = var.cosmosdb_account_consistency_policy
  geo_location        = var.cosmosdb_account_geo_location
  ip_range_filter     = var.cosmosdb_account_ip_range_filter
  kind                = "GlobalDocumentDB"
  location            = var.cosmosdb_account_location
  name                = var.cosmosdb_account_name
  resource_group_name = var.cosmosdb_account_resource_group_name
  tags                = var.cosmosdb_account_tags
}

module "cosmosdb-table" {
  source = "../azurerm-cosmosdb-table"

  name                = var.cosmosdb_table_name
  resource_group_name = module.cosmos-table-account.this.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.cosmosdb_table_throughput
}

# Allow time for the diagnostic setting to be destroyed before destroying the Cosmos DB account
# to prevent destruction issue with exclusive lock on the service
# If experiencing status 412 "PreconditionFailed", increase the destroy_duration
resource "time_sleep" "wait" {
  depends_on = [module.cosmos-table-account]

  destroy_duration = "90s"
}

module "diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  depends_on = [resource.time_sleep.wait]

  enabled_log = [
    { category = "DataPlaneRequests" },
    { category = "ControlPlaneRequests" },
    { category = "TableApiRequests" }
  ]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = var.diagnostic_setting_storage_account_id
  target_resource_id             = module.cosmos-table-account.this.id
}

module "azure-cosmosdb-asset" {
  source = "../dsfhub-azure-cosmosdb-table"

  admin_email               = var.azure_cosmosdb_admin_email
  asset_display_name        = module.cosmos-table-account.this.name
  asset_id                  = module.cosmos-table-account.this.id
  audit_pull_enabled        = var.azure_cosmosdb_audit_pull_enabled
  gateway_id                = var.azure_cosmosdb_gateway_id
  logs_destination_asset_id = var.azure_cosmosdb_logs_destination_asset_id
  server_host_name = replace(
    regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-table-account.this.endpoint).hostname,
    "documents",
    "table.cosmos"
  )
  server_port = regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-table-account.this.endpoint).port
}
