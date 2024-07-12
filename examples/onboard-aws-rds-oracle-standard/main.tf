locals {
  aws_region = "us-east-2"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  master_user     = "admin"
  master_password = "abcd1234"
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
# 2. Method to create audit policies on Oracle instance
################################################################################
# 1. AWS key pair variables (sourced from ENV vars)
variable "aws_access_key" {}
variable "aws_secret_key" {}

module "aws-key-pair-account-asset" {
  source = "imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account"

  admin_email        = local.admin_email
  asset_display_name = "aws-key-pair-account-asset"
  asset_id           = "arn:aws:iam::0123456789"
  auth_mechanism     = "key"
  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
  gateway_id         = local.gateway_id
  region             = local.aws_region
}

# 2. Run shell script locally to create audit policy
resource "terraform_data" "configure_database" {
  depends_on = [module.aws-rds-oracle-standard-1]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      HOSTNAME       = module.aws-rds-oracle-standard-1.oracle-instance.address
      SID            = module.aws-rds-oracle-standard-1.oracle-instance.db_name
      PORT           = module.aws-rds-oracle-standard-1.oracle-instance.port
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# AWS RDS Oracle 19
################################################################################
module "aws-rds-oracle-standard-1" {
  source = "../../modules/onboard-aws-rds-oracle-standard"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_oracle_admin_email     = local.admin_email
  aws_rds_oracle_gateway_id      = local.gateway_id
  aws_rds_oracle_parent_asset_id = module.aws-key-pair-account-asset.this.asset_id
  aws_rds_oracle_region          = local.aws_region

  instance_engine_version    = "19"
  instance_identifier        = "example-tf-oracle-19"
  instance_password          = local.master_password
  instance_subnet_group_name = "default"
  instance_username          = local.master_user
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "oracle-ee-19"
  parameter_group_name   = "example-tf-oracle-19-pg"
}

################################################################################
# AWS RDS Oracle 19 Aggregated
################################################################################
module "aws-rds-oracle-standard-2" {
  source = "../../modules/onboard-aws-rds-oracle-standard"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_oracle_admin_email     = local.admin_email
  aws_rds_oracle_audit_type      = "AGGREGATED"
  aws_rds_oracle_gateway_id      = local.gateway_id
  aws_rds_oracle_parent_asset_id = module.aws-key-pair-account-asset.this.asset_id
  aws_rds_oracle_region          = local.aws_region

  instance_engine_version    = "19"
  instance_identifier        = "example-tf-oracle-19"
  instance_password          = local.master_password
  instance_subnet_group_name = "default"
  instance_username          = local.master_user
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "oracle-ee-19"
  parameter_group_name   = "example-tf-oracle-19-pg"
}
