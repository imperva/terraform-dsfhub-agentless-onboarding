locals {
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

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# auth_mechanism: auth_file
################################################################################
module "azure-auth-file-account-asset" {
  source = "../../modules/dsfhub-azure-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "azure-auth-file-account-asset"
  asset_id           = "/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeffffgggghhhh/my_app_name"
  auth_mechanism     = "auth_file"
  gateway_id         = local.gateway_id
  key_file           = "/data/jsonar/local/credentials/azure_auth_file.json"
  reason             = "default"
}

################################################################################
# auth_mechanism: client_secret
################################################################################
module "azure-client-secret-account-asset" {
  source = "../../modules/dsfhub-azure-cloud-account"

  admin_email        = local.admin_email
  application_id     = ""
  asset_display_name = "azure-client-secret-account-asset"
  asset_id           = ""
  auth_mechanism     = "client_secret"
  client_secret      = ""
  directory_id       = ""
  gateway_id         = local.gateway_id
  reason             = "default"
  subscription_id    = ""

}

################################################################################
# auth_mechanism: managed_identity
################################################################################
module "azure-managed-identity-account-asset" {
  source = "../../modules/dsfhub-azure-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "azure-managed-identity-account-asset"
  asset_id           = ""
  auth_mechanism     = "managed_identity"
  gateway_id         = local.gateway_id
  reason             = "default"
  subscription_id    = ""
}

