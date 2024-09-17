terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

module "cosmos-sql-account" {
  source = "../azurerm-cosmosdb-account"

  capabilities         = var.cosmosdb_account_capabilities
  consistency_policy   = var.cosmosdb_account_consistency_policy
  geo_location         = var.cosmosdb_account_geo_location
  kind                 = "GlobalDocumentDB"
  location             = var.cosmosdb_account_location
  mongo_server_version = null
  name                 = var.cosmosdb_account_name
  resource_group_name  = var.cosmosdb_account_resource_group_name
  tags                 = var.cosmosdb_account_tags
}

# Enabling "full-text query" is not currently supported via the azurerm provider
# see: https://github.com/hashicorp/terraform-provider-azurerm/issues/13809
module "enable-full-text-query" {
  source = "../azapi-update-resource"

  body = jsonencode({
    properties = {
      diagnosticLogSettings = {
        enableFullTextQuery = "True"
      }
    }
  })
  resource_id = module.cosmos-sql-account.this.id
  type        = "Microsoft.DocumentDB/databaseAccounts@2021-05-01-preview"
}

module "diagnostic-setting" {
  source = "../azurerm-monitor-diagnostic-setting"

  enabled_log = [
    { category = "DataPlaneRequests" },
    { category = "ControlPlaneRequests" },
    { category = "QueryRuntimeStatistics" }
  ]
  eventhub_authorization_rule_id = var.diagnostic_setting_eventhub_authorization_rule_id
  eventhub_name                  = var.diagnostic_setting_eventhub_name
  metric                         = null
  name                           = var.diagnostic_setting_name
  storage_account_id             = var.diagnostic_setting_storage_account_id
  target_resource_id             = module.cosmos-sql-account.this.id
}

module "azure-cosmosdb-asset" {
  source = "../dsfhub-azure-cosmosdb"

  admin_email               = var.azure_cosmosdb_admin_email
  asset_display_name        = module.cosmos-sql-account.this.name
  asset_id                  = module.cosmos-sql-account.this.id
  audit_pull_enabled        = var.azure_cosmosdb_audit_pull_enabled
  gateway_id                = var.azure_cosmosdb_gateway_id
  logs_destination_asset_id = var.azure_cosmosdb_logs_destination_asset_id
  server_host_name          = regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-sql-account.this.endpoint).hostname
  server_port               = regex("(?P<protocol>.*)://(?P<hostname>.*):(?P<port>.*)/", module.cosmos-sql-account.this.endpoint).port
}