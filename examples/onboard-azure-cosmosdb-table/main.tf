locals {
  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"
  azure_allowed_ip_range    = ["1.2.3.4/32"]

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

provider "azapi" {}

provider "azurerm" {
  features {}
  subscription_id = local.azure_subscription_id
}

variable "dsfhub_host" {}    # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {}   # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Prerequisites
# 1. Azure Event Hub Namespace and Event Hub. Includes authorization rules for
#    reading and writing to the Event Hub.
# 2. Storage Account and Container
################################################################################
module "onboard-cosmos-table-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Cosmos_Table"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "cosmostableeventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "cosmostableeventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "cosmostablestorage"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "cosmostablestoragecon"
}

################################################################################
# Azure Cosmos DB for Table API
################################################################################
module "azure-cosmosdb-table-1" {
  source = "../../modules/onboard-azure-cosmosdb-table"

  depends_on = [module.onboard-cosmos-table-eventhub-1]

  azure_cosmosdb_admin_email               = local.admin_email
  azure_cosmosdb_audit_pull_enabled        = true
  azure_cosmosdb_gateway_id                = local.gateway_id
  azure_cosmosdb_logs_destination_asset_id = module.onboard-cosmos-table-eventhub-1.azure-eventhub-asset.asset_id

  cosmosdb_account_consistency_policy = [
    {
      "consistency_level" : "Session"
    }
  ]
  cosmosdb_account_geo_location = [
    {
      "failover_priority" : 0,
      "location" : "eastus",
      "zone_redundant" : false
    }
  ]
  cosmosdb_account_ip_range_filter     = local.azure_allowed_ip_range
  cosmosdb_account_location            = local.azure_location
  cosmosdb_account_name                = "example-cosmos-table-acc"
  cosmosdb_account_resource_group_name = local.azure_resource_group_name

  cosmosdb_table_name = "example-cosmos-table"

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-table-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-table-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}


################################################################################
# Azure Cosmos DB for NoSQL API Many-to-One
################################################################################
locals {
  cosmos_sql_types = toset([
    "dev",
    "prod",
    "uat"
  ])
}

module "azure-cosmosdb-table-2" {
  source = "../../modules/onboard-azure-cosmosdb-table"

  depends_on = [module.onboard-cosmos-table-eventhub-1]

  for_each = local.cosmos_sql_types

  azure_cosmosdb_admin_email               = local.admin_email
  azure_cosmosdb_audit_pull_enabled        = true
  azure_cosmosdb_gateway_id                = local.gateway_id
  azure_cosmosdb_logs_destination_asset_id = module.onboard-cosmos-table-eventhub-1.azure-eventhub-asset.asset_id

  cosmosdb_account_consistency_policy = [
    {
      "consistency_level" : "Session"
    }
  ]
  cosmosdb_account_geo_location = [
    {
      "failover_priority" : 0,
      "location" : "eastus",
      "zone_redundant" : false
    }
  ]
  cosmosdb_account_ip_range_filter     = local.azure_allowed_ip_range
  cosmosdb_account_location            = local.azure_location
  cosmosdb_account_name                = "example-cosmos-table-${each.key}"
  cosmosdb_account_resource_group_name = local.azure_resource_group_name

  cosmosdb_table_name = "example-cosmos-table"

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-table-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-table-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}
