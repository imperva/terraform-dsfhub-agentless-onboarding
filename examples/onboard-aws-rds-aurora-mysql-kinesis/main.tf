locals {
  aws_region        = "us-east-2"
  apply_immediately = true
  master_user       = "admin"
  master_password   = "Abcd1234"

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
# 1. AWS cloud account
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
# Amazon Aurora MySQL via kinesis stream
################################################################################
module "aws-aurora-mysql-kinesis" {
  source = "../../modules/onboard-aws-rds-aurora-mysql-kinesis"

  aws_aurora_mysql_cluster_admin_email     = local.admin_email
  aws_aurora_mysql_cluster_gateway_id      = local.gateway_id
  aws_aurora_mysql_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_aurora_mysql_cluster_region          = local.aws_region

  aws_kinesis_admin_email        = local.admin_email
  aws_kinesis_audit_pull_enabled = true
  aws_kinesis_gateway_id         = local.gateway_id
  aws_kinesis_reason             = "default"
  aws_kinesis_region             = local.aws_region

  cluster_apply_immediately  = local.apply_immediately
  cluster_db_master_password = local.master_password
  cluster_db_master_username = local.master_user
  cluster_id                 = "tf-aurora-mysql-kinesis-cluster"
  cluster_final_snapshot     = true

  instance_apply_immediately   = local.apply_immediately
  instance_identifier          = "tf-aurora-mysql-kinesis-instance"
  instance_publicly_accessible = true
}
