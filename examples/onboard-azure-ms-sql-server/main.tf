locals {
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
module "onboard-azure-sql-server-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Sql"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "sqlservereventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "sqlservereventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "sqlserverstorageacc"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "sqlserverstoragecon"
}

################################################################################
# Azure SQL Server
################################################################################
module "azure-ms-sql-server-1" {
  source = "../../modules/onboard-azure-ms-sql-server"

  depends_on = [module.onboard-azure-sql-server-eventhub-1]

  azure_ms_sql_server_admin_email               = local.admin_email
  azure_ms_sql_server_audit_pull_enabled        = true
  azure_ms_sql_server_gateway_id                = local.gateway_id
  azure_ms_sql_server_location                  = local.azure_location
  azure_ms_sql_server_logs_destination_asset_id = module.onboard-azure-sql-server-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-sql-server-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-sql-server-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"

  server_administrator_login           = "exampleadmin"
  server_administrator_login_password  = "Abcd1234"
  server_location                      = local.azure_location
  server_name                          = "example-azure-sql-server"
  server_public_network_access_enabled = true
  server_resource_group_name           = local.azure_resource_group_name
}

################################################################################
# Azure SQL Server Many-to-One
################################################################################
locals {
  sql_server_types = toset([
    "dev",
    "prod",
    "uat"
  ])
}

module "azure-ms-sql-server-2" {
  source = "../../modules/onboard-azure-ms-sql-server"

  depends_on = [module.onboard-azure-sql-server-eventhub-1]

  for_each = local.sql_server_types

  azure_ms_sql_server_admin_email               = local.admin_email
  azure_ms_sql_server_audit_pull_enabled        = true
  azure_ms_sql_server_gateway_id                = local.gateway_id
  azure_ms_sql_server_location                  = local.azure_location
  azure_ms_sql_server_logs_destination_asset_id = module.onboard-azure-sql-server-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-sql-server-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-sql-server-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"

  server_administrator_login           = "exampleadmin"
  server_administrator_login_password  = "Abcd1234"
  server_location                      = local.azure_location
  server_name                          = "example-azure-sql-server-${each.key}"
  server_public_network_access_enabled = true
  server_resource_group_name           = local.azure_resource_group_name
}
