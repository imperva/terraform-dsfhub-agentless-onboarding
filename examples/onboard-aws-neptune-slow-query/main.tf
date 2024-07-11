locals {
  aws_region = "us-east-2"
  vpc_security_group_ids = [
    "sg-12a345678912b1c2a",
    "sg-34b456789c12b231e"
  ]
  subnet_group_name = "my-subnet-group"
  admin_email       = "person@example.com"
  gateway_id        = "a1b2c3d4-1234-5678-9123-cd1edcef7642"
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
# AWS cloud account
################################################################################

module "aws-default-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-account-asset"
  asset_id           = "arn:aws:iam::123456789101:role/iam-role"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# Amazon Neptune
################################################################################
module "aws-neptune-slowquery-1" {
  source = "../../modules/onboard-aws-neptune-slow-query"

  parameter_group_name   = "nept-clus-group"
  parameter_group_family = "neptune1.3"
  parameter_group_parameters = [
    {
      name         = "neptune_enable_audit_log"
      value        = 1
      apply_method = "pending-reboot"
    },
    {
      name  = "neptune_enable_slow_query_log"
      value = "info"
    },
    {
      name  = "neptune_slow_query_log_threshold"
      value = 5000
    }
  ]

  cluster_identifier                          = "nept-tf-cluster"
  cluster_skip_final_snapshot                 = true
  cluster_vpc_security_group_ids              = local.vpc_security_group_ids
  cluster_iam_database_authentication_enabled = true
  cluster_engine_version                      = "1.3.2.0"
  cluster_apply_immediately                   = true
  cluster_storage_type                        = "standard"

  instance_apply_immediately            = true
  instance_identifier                   = "nept-instance"
  instance_neptune_subnet_group_name    = local.subnet_group_name
  instance_publicly_accessible          = false
  instance_neptune_parameter_group_name = "default.neptune1.3"
  instance_class                        = "db.t3.medium"

  aws_neptune_cluster_admin_email     = local.admin_email
  aws_neptune_cluster_gateway_id      = local.gateway_id
  aws_neptune_cluster_region          = local.aws_region
  aws_neptune_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id

  aws_log_group_audit_pull_enabled = true
}