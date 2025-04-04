locals {
  aws_region = "us-east-1"

  admin_email       = "test@example.com"
  apply_immediately = true
  gateway_id        = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"
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
  source = "../../modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-account-asset"
  asset_id           = "arn:aws:iam::1234567890"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# Amazon DocumentDB Cluster 5.0.0
################################################################################

module "aws-docdb-cluster-1" {
  source = "../../modules/onboard-aws-docdb-cluster"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_docdb_cluster_admin_email     = local.admin_email
  aws_docdb_cluster_gateway_id      = local.gateway_id
  aws_docdb_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_docdb_cluster_region          = local.aws_region

  cluster_apply_immediately               = local.apply_immediately
  cluster_identifier                      = "example-tf-docdb"
  cluster_db_subnet_group_name            = "default"
  cluster_enabled_cloudwatch_logs_exports = ["audit"]
  cluster_engine_version                  = "5.0.0"
  cluster_master_password                 = "abcd1234"
  cluster_master_username                 = "docdbadmin"
  cluster_skip_final_snapshot             = true
  cluster_vpc_security_group_ids          = ["sg-0123456789abcdefg"]

  instance_apply_immediately = local.apply_immediately
  instance_count             = 1
  instance_instance_class    = "db.t3.medium"

  parameter_group_family = "docdb5.0"
  parameter_group_name   = "docdb-pg-test4"
}
