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
# 1. Azure Event Hub Namespace and Event Hub
module "eventhub-namespace" {
  source = "../../modules/azurerm-eventhub-namespace"

  location            = local.azure_location
  name                = "${local.azure_eventhub_name}ns"
  resource_group_name = local.azure_resource_group_name
}

module "eventhub" {
  source = "../../modules/azurerm-eventhub"

  name                = local.azure_eventhub_name
  namespace_name      = module.eventhub-namespace.this.name
  resource_group_name = local.azure_resource_group_name
}

module "eventhub-write-authorization" {
  source = "../../modules/azurerm-eventhub-namespace-authorization-rule"

  listen              = false
  manage              = false
  name                = "${local.azure_eventhub_name}write"
  namespace_name      = module.eventhub-namespace.this.name
  resource_group_name = local.azure_resource_group_name
  send                = true
}

module "eventhub-read-authorization" {
  source = "../../modules/azurerm-eventhub-namespace-authorization-rule"

  listen              = true
  manage              = false
  name                = "${local.azure_eventhub_name}read"
  namespace_name      = module.eventhub-namespace.this.name
  resource_group_name = local.azure_resource_group_name
  send                = false
}

# 2. Storage Account and Container
module "storage-account" {
  source = "../../modules/azurerm-storage-account"

  location            = local.azure_location
  name                = "cosmosmongostorageacc"
  resource_group_name = local.azure_resource_group_name
}

module "storage-container" {
  source = "../../modules/azurerm-storage-container"

  name                 = "cosmosmongostoragecon"
  storage_account_name = module.storage-account.this.name
}

################################################################################
# Azure Cosmos DB with Mongo API v4.2
################################################################################
module "azure-cosmosdb-mongo-1" {
  source = "../../modules/onboard-azure-cosmosdb-mongo"

  azure_cosmosdb_admin_email        = local.admin_email
  azure_cosmosdb_audit_pull_enabled = true
  azure_cosmosdb_gateway_id         = local.gateway_id

  azure_eventhub_admin_email              = local.admin_email
  azure_eventhub_asset_display_name       = module.eventhub.this.name
  azure_eventhub_asset_id                 = module.eventhub.this.id
  azure_eventhub_audit_pull_enabled       = true
  azure_eventhub_azure_storage_account    = module.storage-account.this.name
  azure_eventhub_azure_storage_container  = module.storage-container.this.name
  azure_eventhub_azure_storage_secret_key = module.storage-account.this.primary_access_key
  azure_eventhub_eventhub_access_key      = module.eventhub-read-authorization.this.primary_key
  azure_eventhub_eventhub_access_policy   = module.eventhub-read-authorization.this.name
  azure_eventhub_eventhub_name            = module.eventhub.this.name
  azure_eventhub_eventhub_namespace       = module.eventhub.this.namespace_name
  azure_eventhub_gateway_id               = local.gateway_id

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

  diagnostic_setting_eventhub_authorization_rule_id = module.eventhub-write-authorization.this.id
  diagnostic_setting_eventhub_name                  = module.eventhub.this.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"
}
