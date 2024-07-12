locals {
  aws_region = "us-east-2"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  master_user = "admin"
  master_pass = "abcd1234"
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

provider "aws" {
  region = local.aws_region
}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Prerequisites
# 1. AWS cloud account
################################################################################
module "aws-default-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# AWS RDS MySQL 8.0
################################################################################
module "aws-rds-mysql-1" {
  source = "../../modules/onboard-aws-rds-mysql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_mysql_admin_email     = local.admin_email
  aws_rds_mysql_gateway_id      = local.gateway_id
  aws_rds_mysql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_mysql_region          = local.aws_region

  instance_engine_version    = "8.0"
  instance_identifier        = "example-tf-mysql-8"
  instance_instance_class    = "db.t3.small"
  instance_password          = local.master_pass
  instance_subnet_group_name = "default"
  instance_username          = local.master_user
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  option_group_major_engine_version = "8.0"
  option_group_name                 = "example-tf-mysql-8-og"
}

################################################################################
# AWS RDS MySQL 5.7 Aggregated
################################################################################
module "aws-rds-mysql-2" {
  source = "../../modules/onboard-aws-rds-mysql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_mysql_admin_email     = local.admin_email
  aws_rds_mysql_audit_type      = "AGGREGATED"
  aws_rds_mysql_gateway_id      = local.gateway_id
  aws_rds_mysql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_mysql_region          = local.aws_region

  instance_engine_version    = "5.7"
  instance_identifier        = "example-tf-mysql-5-7"
  instance_instance_class    = "db.t3.small"
  instance_password          = local.master_pass
  instance_subnet_group_name = "default"
  instance_username          = local.master_user
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  option_group_major_engine_version = "5.7"
  option_group_name                 = "example-tf-mysql-5-7-og"
}
