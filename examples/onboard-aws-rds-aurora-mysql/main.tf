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
  source = "../../modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-account-asset"
  asset_id           = "arn:aws:iam::123456789101:role/iam-role"
  auth_mechanism     = "default"
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

################################################################################
# Amazon Aurora MySQL
################################################################################

module "aws-aurora-mysql" {
  source = "../../modules/onboard-aws-rds-aurora-mysql"

  cluster_parameter_group_name = "aurora-mysql-cpg-tf"

  cluster_identifier             = "aurora-mysql-cluster"
  cluster_master_username        = "admin"
  cluster_master_password        = "mypassword"
  cluster_db_subnet_group_name   = local.subnet_group_name
  cluster_vpc_security_group_ids = local.vpc_security_group_ids

  instance_identifier          = "aurora-mysql"
  instance_publicly_accessible = false

  aws_aurora_mysql_cluster_admin_email     = local.admin_email
  aws_aurora_mysql_cluster_gateway_id      = local.gateway_id
  aws_aurora_mysql_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_aurora_mysql_cluster_region          = local.aws_region

  aws_log_group_audit_pull_enabled = true
}
