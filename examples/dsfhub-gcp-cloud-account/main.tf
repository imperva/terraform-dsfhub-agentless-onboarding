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
# auth_mechanism: default
################################################################################
module "gcp-default-asset" {
  source = "../../modules/dsfhub-gcp-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "default-gcp-account-asset"
  asset_id           = "default_account@project-name.iam.gserviceaccount.com:project-name"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  reason             = "default"
}

################################################################################
# auth_mechanism: service_account
################################################################################
module "gcp-service-account-asset" {
  source = "../../modules/dsfhub-gcp-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "service-account-gcp-account-asset"
  asset_id           = "my_service_account@project-name.iam.gserviceaccount.com:project-name"
  auth_mechanism     = "service_account"
  gateway_id         = local.gateway_id
  key_file           = "/data/jsonar/local/credentials/gcp_service_account.json"
}
