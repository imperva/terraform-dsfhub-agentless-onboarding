locals {
  azure_eventhub_name       = "cosmosnosqleventhub"
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
module "onboard-cosmos-nosql-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Cosmos_SQL"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "cosmosnosqleventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "cosmosnosqleventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "cosmossqlstorageacc"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "cosmossqlstoragecon"
}

################################################################################
# Azure Cosmos DB for NoSQL API
################################################################################
module "azure-cosmosdb-nosql-1" {
  source = "../../modules/onboard-azure-cosmosdb-nosql"

  depends_on = [module.onboard-cosmos-nosql-eventhub-1]

  azure_cosmosdb_admin_email               = local.admin_email
  azure_cosmosdb_audit_pull_enabled        = true
  azure_cosmosdb_gateway_id                = local.gateway_id
  azure_cosmosdb_logs_destination_asset_id = module.onboard-cosmos-nosql-eventhub-1.azure-eventhub-asset.asset_id

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
  cosmosdb_account_location            = local.azure_location
  cosmosdb_account_name                = "example-cosmos-nosql"
  cosmosdb_account_resource_group_name = local.azure_resource_group_name

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-nosql-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-nosql-eventhub-1.eventhub.name
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

module "azure-cosmosdb-nosql-2" {
  source = "../../modules/onboard-azure-cosmosdb-nosql"

  depends_on = [module.onboard-cosmos-nosql-eventhub-1]

  for_each = local.cosmos_sql_types

  azure_cosmosdb_admin_email               = local.admin_email
  azure_cosmosdb_audit_pull_enabled        = true
  azure_cosmosdb_gateway_id                = local.gateway_id
  azure_cosmosdb_logs_destination_asset_id = module.onboard-cosmos-nosql-eventhub-1.azure-eventhub-asset.asset_id

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
  cosmosdb_account_location            = local.azure_location
  cosmosdb_account_name                = "example-cosmos-nosql-${each.key}"
  cosmosdb_account_resource_group_name = local.azure_resource_group_name

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-cosmos-nosql-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-cosmos-nosql-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}
