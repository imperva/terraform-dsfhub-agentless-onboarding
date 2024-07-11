locals {
  aws_region = "us-east-2"

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
# AWS RDS MariaDB 10.11
################################################################################
module "aws-rds-mariadb" {
  source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-mariadb"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_mariadb_admin_email     = local.admin_email
  aws_rds_mariadb_gateway_id      = local.gateway_id
  aws_rds_mariadb_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_mariadb_region          = local.aws_region

  instance_db_name                         = "testdb"
  instance_enabled_cloudwatch_logs_exports = ["audit"]
  instance_engine_version                  = "10.11"
  instance_identifier                      = "example-tf-rds-mariadb"
  instance_instance_class                  = "db.t3.small"
  instance_password                        = "abcd1234"
  instance_publicly_accessible             = true
  instance_skip_final_snapshot             = true
  instance_subnet_group_name               = "default"
  instance_username                        = "admin"
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  option_group_major_engine_version = "10.11"
  option_group_name                 = "example-tf-mariadb-og"
  option_group_options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"
      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT,QUERY,TABLE"
        },
        {
          name  = "SERVER_AUDIT_EXCL_USERS"
          value = "rdsadmin"
        }
      ]
    }
  ]
}
