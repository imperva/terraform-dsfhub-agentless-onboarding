locals {
  admin_email     = "test@example.com"
  eventhub_format = "Cosmos_Mongo" # example format
  gateway_id      = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  azure_location            = "East US"
  azure_resource_group_name = "My_Resource_Group"
  azure_subscription_id     = "123456790-wxyz-g8h9-e5f6-a1b2c3d4"

  eventhub_name           = "dsfhub-tf-eventhub"
  eventhub_namespace_name = "dsfhub-tf-namespace"

  storage_account_name   = "dsfhubstorageacctf"
  storage_container_name = "dsfhub-container-tf"
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

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

provider "azurerm" {
  features {}
  subscription_id = local.azure_subscription_id
}

################################################################################
# auth_mechanism: default
################################################################################
module "onboard-azure-eventhub-default" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email    = local.admin_email
  azure_eventhub_auth_mechanism = "default"
  azure_eventhub_format         = local.eventhub_format
  azure_eventhub_gateway_id     = local.gateway_id

  eventhub_name                          = local.eventhub_name
  eventhub_resource_group_name           = local.azure_resource_group_name
  eventhub_namespace_resource_group_name = local.azure_resource_group_name
  eventhub_namespace_name                = local.eventhub_namespace_name
  eventhub_namespace_location            = local.azure_location

  storage_account_location            = local.azure_location
  storage_account_name                = local.storage_account_name
  storage_container_name              = local.storage_container_name
  storage_account_resource_group_name = local.azure_resource_group_name
}

################################################################################
# auth_mechanism: client_secret
################################################################################
module "onboard-azure-eventhub-client-secret" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email     = local.admin_email
  azure_eventhub_auth_mechanism  = "client_secret"
  azure_eventhub_application_id  = "your-application-id"
  azure_eventhub_client_secret   = "your-client-secret"
  azure_eventhub_directory_id    = "your-directory-id"
  azure_eventhub_format          = local.eventhub_format
  azure_eventhub_gateway_id      = local.gateway_id
  azure_eventhub_subscription_id = local.azure_subscription_id

  eventhub_name                          = local.eventhub_name
  eventhub_resource_group_name           = local.azure_resource_group_name
  eventhub_namespace_resource_group_name = local.azure_resource_group_name
  eventhub_namespace_name                = local.eventhub_namespace_name
  eventhub_namespace_location            = local.azure_location

  storage_account_location            = local.azure_location
  storage_account_name                = local.storage_account_name
  storage_container_name              = local.storage_container_name
  storage_account_resource_group_name = local.azure_resource_group_name
}

################################################################################
# auth_mechanism: azure_ad with system-assigned managed identity
################################################################################
module "onboard-azure-eventhub-azure-ad-1" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email    = local.admin_email
  azure_eventhub_auth_mechanism = "azure_ad"
  azure_eventhub_format         = local.eventhub_format
  azure_eventhub_gateway_id     = local.gateway_id

  eventhub_name                          = local.eventhub_name
  eventhub_resource_group_name           = local.azure_resource_group_name
  eventhub_namespace_resource_group_name = local.azure_resource_group_name
  eventhub_namespace_name                = local.eventhub_namespace_name
  eventhub_namespace_location            = local.azure_location

  storage_account_location            = local.azure_location
  storage_account_name                = local.storage_account_name
  storage_container_name              = local.storage_container_name
  storage_account_resource_group_name = local.azure_resource_group_name
}

################################################################################
# auth_mechanism: azure_ad with user-assigned managed identity
################################################################################
module "onboard-azure-eventhub-azure-ad-2" {
  source = "../../modules/onboard-azure-eventhub"

  azure_eventhub_admin_email             = local.admin_email
  azure_eventhub_auth_mechanism          = "azure_ad"
  azure_eventhub_format                  = local.eventhub_format
  azure_eventhub_gateway_id              = local.gateway_id
  azure_eventhub_user_identity_client_id = "your-user-identity-client-id"

  eventhub_name                          = local.eventhub_name
  eventhub_resource_group_name           = local.azure_resource_group_name
  eventhub_namespace_resource_group_name = local.azure_resource_group_name
  eventhub_namespace_name                = local.eventhub_namespace_name
  eventhub_namespace_location            = local.azure_location

  storage_account_location            = local.azure_location
  storage_account_name                = local.storage_account_name
  storage_container_name              = local.storage_container_name
  storage_account_resource_group_name = local.azure_resource_group_name
}
