locals {
  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"

  managed_instance_admin          = "testadmin"
  managed_instance_admin_password = "Abcd1234"
  server_audit_name               = "tfmanagedsqlserveraudit"
  server_audit_spec_name          = "tfmanagedsqlserverauditspec"

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
# 3. Method to create server audit policy on the instance.
################################################################################
# 1 and 2
module "onboard-azure-sql-managed-instance-eventhub-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email = local.admin_email
  azure_eventhub_format      = "AzureSQL_Managed"
  azure_eventhub_gateway_id  = local.gateway_id

  eventhub_name                          = "sqlmanagedeventhub"
  eventhub_namespace_location            = local.azure_location
  eventhub_namespace_name                = "sqlmanagedeventhubns"
  eventhub_namespace_resource_group_name = local.azure_resource_group_name

  eventhub_resource_group_name = local.azure_resource_group_name

  storage_account_location            = local.azure_location
  storage_account_name                = "sqlmanagedstorageacc"
  storage_account_resource_group_name = local.azure_resource_group_name
  storage_container_name              = "sqlmanagedstoragecon"
}

# 3. Run shell script locally to create the server audit policy on the newly created instance
# Get current IP address
data "http" "my-ip" {
  url = "http://icanhazip.com"
}

# Create security group rule for current IP
locals {
  allow_tf_localhost_security_rule = {
    name                       = "allow_tf_localhost_security_rule"
    access                     = "Allow"
    description                = "allow terraform host to connect to managed instance"
    destination_address_prefix = "*"
    destination_port_range     = "3342"
    direction                  = "Inbound"
    priority                   = 1001
    protocol                   = "Tcp"
    source_address_prefix      = chomp(data.http.my-ip.response_body)
    source_port_range          = "*"
  }
}

# Construct public endpoint
locals {
  fqdn_parsing                     = regex("([^.]+)(.*)", module.sql-managed-instance-1.azure-ms-sql-managed-instance.fqdn) # Split after instance name
  managed_instance_public_endpoint = "${local.fqdn_parsing[0]}.public${local.fqdn_parsing[1]},3342"                         # Add ".public" and public port
}

# Create server audit policy
resource "terraform_data" "configure_database-1" {
  depends_on = [module.sql-managed-instance-1]

  triggers_replace = 1

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.managed_instance_admin
      ADMIN_PASSWORD = local.managed_instance_admin_password
      ENDPOINT       = local.managed_instance_public_endpoint

      SERVER_AUDIT_NAME      = local.server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Azure SQL Managed Instance
################################################################################
module "sql-managed-instance-1" {
  source = "../../modules/onboard-azure-sql-managed-instance"

  azure_sql_managed_instance_admin_email               = local.admin_email
  azure_sql_managed_instance_audit_pull_enabled        = true
  azure_sql_managed_instance_gateway_id                = local.gateway_id
  azure_sql_managed_instance_location                  = local.azure_location
  azure_sql_managed_instance_logs_destination_asset_id = module.onboard-azure-sql-managed-instance-eventhub-1.azure-eventhub-asset.asset_id

  diagnostic_setting_eventhub_authorization_rule_id = module.onboard-azure-sql-managed-instance-eventhub-1.eventhub-write-authorization.id
  diagnostic_setting_eventhub_name                  = module.onboard-azure-sql-managed-instance-eventhub-1.eventhub.name
  diagnostic_setting_name                           = "dsfhubdiagnostic"

  managed_instance_administrator_login          = local.managed_instance_admin
  managed_instance_administrator_login_password = local.managed_instance_admin_password
  managed_instance_location                     = local.azure_location
  managed_instance_name                         = "tf-example-sql-managed-instance"
  managed_instance_public_data_endpoint_enabled = true
  managed_instance_resource_group_name          = local.azure_resource_group_name

  route_table_resource_group_name = local.azure_resource_group_name

  security_group_resource_group_name = local.azure_resource_group_name
  security_group_security_rules      = [local.allow_tf_localhost_security_rule]

  virtual_network_resource_group_name = local.azure_resource_group_name
}
