locals {
  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"

  postgresql_admin          = "exampleadmin"
  postgresql_admin_password = "Abcd1234"

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
# 3. Method to create 'pgaudit' extension on the postgresql instance.
################################################################################
# 1 and 2
module "onboard-azure-postgresql-flexible-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "Postgresql_Flexible"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "pgflexeventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "pgflexeventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "pgflexstorageacc"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "pgflexstoragecon"
}

# 3. Run shell script locally to create extension on the newly created postgresql instance. 
# Get current IP address
data "http" "my-ip" {
  url = "http://icanhazip.com"
}

# Allow access to postgresql instance from current IP address
resource "azurerm_postgresql_flexible_server_firewall_rule" "my-ip" {
  name             = "dsfhub-example"
  server_id        = module.azure-postgresql-flexible-1.postgresql-server.id
  start_ip_address = chomp(data.http.my-ip.response_body)
  end_ip_address   = chomp(data.http.my-ip.response_body)
}

# Run shell script
resource "terraform_data" "configure_database" {
  depends_on = [module.azure-postgresql-flexible-1]

  provisioner "local-exec" {

    environment = {
      PGHOST     = module.azure-postgresql-flexible-1.postgresql-server.fqdn
      PGUSER     = local.postgresql_admin
      PGPASSWORD = local.postgresql_admin_password
      PGPORT     = "5432"
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Azure PostgreSQL Flexible 16
################################################################################
module "azure-postgresql-flexible-1" {
  source = "../../modules/onboard-azure-postgresql-flexible"

  azure_postgresql_flexible_admin_email               = local.admin_email
  azure_postgresql_flexible_audit_pull_enabled        = true
  azure_postgresql_flexible_gateway_id                = local.gateway_id
  azure_postgresql_flexible_location                  = local.azure_location
  azure_postgresql_flexible_logs_destination_asset_id = module.onboard-azure-postgresql-flexible-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub.name

  server_firewall_rules = local.firewall_rules

  server_administrator_login           = local.postgresql_admin
  server_administrator_password        = local.postgresql_admin_password
  server_location                      = local.azure_location
  server_name                          = "example-azure-pg-flex"
  server_postgres_version              = 16
  server_public_network_access_enabled = true
  server_resource_group_name           = local.azure_resource_group_name
}

################################################################################
# Azure PostgreSQL Flexible 16 with Slow Query Monitoring
################################################################################
module "azure-postgresql-flexible-2" {
  source = "../../modules/onboard-azure-postgresql-flexible"

  azure_postgresql_flexible_admin_email               = local.admin_email
  azure_postgresql_flexible_audit_pull_enabled        = true
  azure_postgresql_flexible_gateway_id                = local.gateway_id
  azure_postgresql_flexible_location                  = local.azure_location
  azure_postgresql_flexible_logs_destination_asset_id = module.onboard-azure-postgresql-flexible-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub.name

  server_firewall_rules = local.firewall_rules

  server_administrator_login           = local.postgresql_admin
  server_administrator_password        = local.postgresql_admin_password
  server_location                      = local.azure_location
  server_name                          = "example-azure-pg-flex"
  server_postgres_version              = 16
  server_public_network_access_enabled = true
  server_resource_group_name           = local.azure_resource_group_name

  server_configurations = [
    {
      "name" : "pgaudit.log",
      "value" : "all"
    },
    {
      "name" : "log_line_prefix",
      "value" : "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x|"
    },
    {
      "name" : "azure.extensions",
      "value" : "pgaudit"
    },
    {
      "name" : "shared_preload_libraries",
      "value" : "pgaudit"
    },
    {
      "name" : "log_min_duration_statement",
      "value" : 1000
    }
  ]
}

################################################################################
# Azure PostgreSQL Flexible 16 Many-to-One
################################################################################
locals {
  postgres_types = toset([
    "dev",
    "prod",
    "uat"
  ])
}

module "azure-postgresql-flexible-3" {
  source = "../../modules/onboard-azure-postgresql-flexible"

  for_each = local.postgres_types

  azure_postgresql_flexible_admin_email               = local.admin_email
  azure_postgresql_flexible_audit_pull_enabled        = true
  azure_postgresql_flexible_gateway_id                = local.gateway_id
  azure_postgresql_flexible_location                  = local.azure_location
  azure_postgresql_flexible_logs_destination_asset_id = module.onboard-azure-postgresql-flexible-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-postgresql-flexible-eventhub-1.eventhub.name

  server_firewall_rules = local.firewall_rules

  server_administrator_login           = local.postgresql_admin
  server_administrator_password        = local.postgresql_admin_password
  server_location                      = local.azure_location
  server_name                          = "example-azure-pg-flex-${each.key}"
  server_postgres_version              = 16
  server_public_network_access_enabled = true
  server_resource_group_name           = local.azure_resource_group_name
}
