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
# auth_mechanism: key
################################################################################
module "alibaba-key-account-asset" {
  source = "../../modules/dsfhub-alibaba-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "alibaba-key-account-asset"
  asset_id           = "arn:acs:123456789012-key"
  gateway_id         = local.gateway_id
  region             = "cn-beijing"

  auth_mechanism = "key"
  access_id      = "your-access-id"
  access_key     = "your-access-key"
}

################################################################################
# auth_mechanism: machine_role
################################################################################
module "alibaba-machine-role-account-asset" {
  source = "../../modules/dsfhub-alibaba-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "alibaba-machine-role-account-asset"
  asset_id           = "arn:acs:123456789012-machine-role"
  gateway_id         = local.gateway_id
  region             = "cn-beijing"

  auth_mechanism = "machine_role"
  role_name      = "your-role-name" # optional
}
