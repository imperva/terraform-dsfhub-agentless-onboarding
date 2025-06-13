locals {
  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"

  mysql_admin          = "exampleadmin"
  mysql_admin_password = "Abcd1234"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  firewall_rules = [
    { name = "example-name", start_ip = "123.456.789.012", end_ip = "123.456.789.012" }
  ]
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

module "onboard-azure-mysql-flexible-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Mysql_Flexible"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "mysql-flexible-tf-eh"
  eventhub_resource_group_name           = local.azure_resource_group_name
  eventhub_namespace_resource_group_name = local.azure_resource_group_name
  eventhub_namespace_name                = "mysql-flexible-namespace-tf"
  eventhub_namespace_location            = local.azure_location

  storage_account_location            = local.azure_location
  storage_account_name                = "mysqlflexiblestorageacc"
  storage_container_name              = "mysql-flexible-container-tf"
  storage_account_resource_group_name = local.azure_resource_group_name
}

################################################################################
# Azure MySQL Flexible Server 8
################################################################################
module "azure-mysql-flexible-1" {
  source = "../../modules/onboard-azure-mysql-flexible"

  azure_mysql_flexible_admin_email               = local.admin_email
  azure_mysql_flexible_audit_pull_enabled        = true
  azure_mysql_flexible_gateway_id                = local.gateway_id
  azure_mysql_flexible_location                  = local.azure_location
  azure_mysql_flexible_logs_destination_asset_id = module.onboard-azure-mysql-flexible-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-mysql-flexible-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-mysql-flexible-eventhub-1.eventhub.name

  server_administrator_login    = local.mysql_admin
  server_administrator_password = local.mysql_admin_password
  server_location               = local.azure_location
  server_name                   = "mysql-flexible-tf-server"
  server_mysql_version          = "8.0.21"
  server_public_network_access  = "Enabled"
  server_resource_group_name    = local.azure_resource_group_name
  server_firewall_rules         = local.firewall_rules
}

################################################################################
# Azure MySQL Flexible Server 8 - With Slow Query Monitoring
################################################################################
module "azure-mysql-flexible-2" {
  source = "../../modules/onboard-azure-mysql-flexible"

  azure_mysql_flexible_admin_email               = local.admin_email
  azure_mysql_flexible_audit_pull_enabled        = true
  azure_mysql_flexible_gateway_id                = local.gateway_id
  azure_mysql_flexible_location                  = local.azure_location
  azure_mysql_flexible_logs_destination_asset_id = module.onboard-azure-mysql-flexible-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-mysql-flexible-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-mysql-flexible-eventhub-1.eventhub.name

  server_administrator_login    = local.mysql_admin
  server_administrator_password = local.mysql_admin_password
  server_location               = local.azure_location
  server_name                   = "mysql-flexible-tf-server-with-slow-query"
  server_mysql_version          = "8.0.21"
  server_public_network_access  = "Enabled"
  server_resource_group_name    = local.azure_resource_group_name
  server_firewall_rules         = local.firewall_rules

  server_config_slow_query_log  = true
  server_config_slow_query_time = 0 # time threshold in seconds for slow query logging
}


