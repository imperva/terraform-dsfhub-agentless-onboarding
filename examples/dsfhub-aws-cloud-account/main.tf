locals {
  admin_email = "test@example.com"
  aws_region  = "us-east-2"
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
module "aws-default-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-default-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# auth_mechanism: key
################################################################################
# AWS key pair variables (sourced from ENV vars)
variable "aws_access_key" {}
variable "aws_secret_key" {}

module "aws-key-pair-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-key-pair-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "key"
  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# auth_mechanism: iam_role
################################################################################
module "aws-iam-role-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-iam-role-account-asset"
  asset_id           = "arn:aws:iam::1234567890:role/example-role"
  auth_mechanism     = "iam_role"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# auth_mechanism: profile
################################################################################
module "aws-profile-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-profile-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "profile"
  gateway_id         = local.gateway_id
  profile_name       = "example-profile"
  region             = local.aws_region
}
