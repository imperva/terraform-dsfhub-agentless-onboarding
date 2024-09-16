locals {
  azure_eventhub_name       = "cosmosmongoeventhub"
  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = local.azure_subscription_id
}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

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
module "onboard-cosmos-mongo-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Cosmos_Mongo"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "cosmosmongoeventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "cosmosmongoeventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "cosmosmongostorageacc"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "cosmosmongostoragecon"
}

################################################################################
# Azure Cosmos DB with Mongo API v4.2
################################################################################
module "azure-cosmosdb-mongo-1" {
  source = "../../modules/onboard-azure-cosmosdb-mongo"

  depends_on = [module.onboard-cosmos-mongo-eventhub-1]

  azure_cosmosdb_mongo_admin_email               = local.admin_email
  azure_cosmosdb_mongo_audit_pull_enabled        = true
  azure_cosmosdb_mongo_gateway_id                = local.gateway_id
  azure_cosmosdb_mongo_logs_destination_asset_id = module.onboard-cosmos-mongo-eventhub-1.azure-eventhub-asset.asset_id

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
  cosmosdb_account_location             = local.azure_location
  cosmosdb_account_mongo_server_version = "4.2"
  cosmosdb_account_name                 = "example-cosmos-mongo"
  cosmosdb_account_resource_group_name  = local.azure_resource_group_name

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-mongo-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-mongo-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}

################################################################################
# Azure Cosmos DB with Mongo API v4.2 Many-to-One
################################################################################
locals {
  cosmos_mongo_types = toset([
    "dev",
    "prod",
    "uat"
  ])
}

module "azure-cosmosdb-mongo-2" {
  source = "../../modules/onboard-azure-cosmosdb-mongo"

  depends_on = [module.onboard-cosmos-mongo-eventhub-1]

  for_each = local.cosmos_mongo_types

  azure_cosmosdb_mongo_admin_email               = local.admin_email
  azure_cosmosdb_mongo_audit_pull_enabled        = true
  azure_cosmosdb_mongo_gateway_id                = local.gateway_id
  azure_cosmosdb_mongo_logs_destination_asset_id = module.onboard-cosmos-mongo-eventhub-1.azure-eventhub-asset.asset_id

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
  cosmosdb_account_location             = local.azure_location
  cosmosdb_account_mongo_server_version = "4.2"
  cosmosdb_account_name                 = "example-cosmos-mongo-${each.key}"
  cosmosdb_account_resource_group_name  = local.azure_resource_group_name

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-mongo-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-mongo-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}
