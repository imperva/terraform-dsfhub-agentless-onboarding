locals {
  aws_region        = "us-east-1"
  apply_immediately = true
  master_user       = "admin"
  master_password   = "Abcd1234"

  server_audit_name      = "tfmssqls3serveraudit"
  server_audit_spec_name = "tfmssqls3serverauditspec"

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
# 1. Method to create the server audit and server audit specification
# 2. AWS cloud account
################################################################################
# 1. Run shell script locally to create  the server audit and server audit specification
resource "terraform_data" "configure_database-1" {
  count = length(module.aws-rds-ms-sql-server-1.rds-sql-server-instance)

  depends_on = [module.aws-rds-ms-sql-server-1]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      ENDPOINT       = module.aws-rds-ms-sql-server-1.rds-sql-server-instance[count.index].endpoint

      SERVER_AUDIT_NAME      = local.server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

resource "terraform_data" "configure_database-2" {
  count = length(module.aws-rds-ms-sql-server-2.rds-sql-server-instance)

  depends_on = [module.aws-rds-ms-sql-server-2]
  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      ENDPOINT       = module.aws-rds-ms-sql-server-2.rds-sql-server-instance[count.index].endpoint

      SERVER_AUDIT_NAME      = local.server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

resource "terraform_data" "configure_database-3" {
  count = length(module.aws-rds-ms-sql-server-3.rds-sql-server-instance)

  depends_on = [module.aws-rds-ms-sql-server-3]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      ENDPOINT       = module.aws-rds-ms-sql-server-3.rds-sql-server-instance[count.index].endpoint

      SERVER_AUDIT_NAME      = local.server_audit_name
      SERVER_AUDIT_SPEC_NAME = local.server_audit_spec_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

# 2. AWS cloud account
# Note that the following additional privileges are required for the AWS cloud account:
# rds:DescribeOptionGroups
# s3:GetObject
# s3:ListBucket
# s3:ListAllMyBuckets
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
# Amazon RDS MS SQL Server
################################################################################
module "aws-rds-ms-sql-server-1" {
  source = "../../modules/onboard-aws-rds-ms-sql-server"
  #   source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-ms-sql-server"

  aws_rds_mssql_audit_pull_enabled = true
  aws_rds_mssql_admin_email        = local.admin_email
  aws_rds_mssql_gateway_id         = local.gateway_id
  aws_rds_mssql_region             = local.aws_region

  aws_s3_admin_email        = local.admin_email
  aws_s3_audit_pull_enabled = true
  aws_s3_gateway_id         = local.gateway_id
  aws_s3_parent_asset_id    = module.aws-default-account-asset.this.asset_id
  aws_s3_region             = local.aws_region

  rds_mssql_apply_immediately      = local.apply_immediately
  rds_mssql_identifier             = "tf-rds-mssql"
  rds_mssql_password               = local.master_password
  rds_mssql_username               = local.master_user
  rds_mssql_skip_final_snapshot    = true
  rds_mssql_subnet_group_name      = "default"
  rds_mssql_vpc_security_group_ids = ["sg-0123456789abcdefg"]

  option_group_engine_name          = "sqlserver-se"
  option_group_major_engine_version = "15.00"
  option_group_name                 = "tf-sql-server-option-group"

  iam_role_name   = "tf-rds-sql-server-role"
  iam_role_path   = "/service-role/"
  iam_policy_name = "tf-rds-sql-server-policy"

  s3_bucket        = "tf-s3-bucket"
  s3_force_destroy = true
}

################################################################################
# Amazon RDS MS SQL Server Many-to-One
################################################################################
module "aws-rds-ms-sql-server-2" {
  source = "../../modules/onboard-aws-rds-ms-sql-server"
  #   source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-ms-sql-server"

  aws_rds_mssql_audit_pull_enabled = true
  aws_rds_mssql_admin_email        = local.admin_email
  aws_rds_mssql_gateway_id         = local.gateway_id
  aws_rds_mssql_region             = local.aws_region

  aws_s3_admin_email        = local.admin_email
  aws_s3_audit_pull_enabled = true
  aws_s3_gateway_id         = local.gateway_id
  aws_s3_parent_asset_id    = module.aws-default-account-asset.this.asset_id
  aws_s3_region             = local.aws_region

  db_instance_count = 2

  rds_mssql_apply_immediately      = local.apply_immediately
  rds_mssql_identifier             = "tf-rds-mssql-many-to-one"
  rds_mssql_password               = local.master_password
  rds_mssql_username               = local.master_user
  rds_mssql_skip_final_snapshot    = true
  rds_mssql_subnet_group_name      = "default"
  rds_mssql_vpc_security_group_ids = ["sg-0123456789abcdefg"]

  option_group_engine_name          = "sqlserver-se"
  option_group_major_engine_version = "15.00"
  option_group_name                 = "tf-sql-server-option-group"

  iam_role_name   = "tf-rds-sql-server-role"
  iam_role_path   = "/service-role/"
  iam_policy_name = "tf-rds-sql-server-policy"

  s3_bucket        = "tf-s3-bucket"
  s3_force_destroy = true
}

################################################################################
# Amazon RDS MS SQL Server with S3 Prefix
#
# The additional prefix is required when multiple RDS SQL Servers have the same 
# "DB Identifier" across various regions or accounts.
################################################################################
data "aws_caller_identity" "current" {}

module "aws-rds-ms-sql-server-3" {
  source = "../../modules/onboard-aws-rds-ms-sql-server"
  # source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-ms-sql-server"

  aws_rds_mssql_audit_pull_enabled = true
  aws_rds_mssql_admin_email        = local.admin_email
  aws_rds_mssql_gateway_id         = local.gateway_id
  aws_rds_mssql_region             = local.aws_region

  aws_s3_admin_email        = local.admin_email
  aws_s3_audit_pull_enabled = true
  aws_s3_gateway_id         = local.gateway_id
  aws_s3_parent_asset_id    = module.aws-default-account-asset.this.asset_id
  aws_s3_region             = local.aws_region

  rds_mssql_apply_immediately      = local.apply_immediately
  rds_mssql_identifier             = "tf-rds-mssql-with-s3-prefix"
  rds_mssql_password               = local.master_password
  rds_mssql_username               = local.master_user
  rds_mssql_skip_final_snapshot    = true
  rds_mssql_subnet_group_name      = "default"
  rds_mssql_vpc_security_group_ids = ["sg-0123456789abcdefg"]

  option_group_engine_name          = "sqlserver-se"
  option_group_major_engine_version = "15.00"
  option_group_name                 = "tf-sql-server-option-group"

  iam_role_name   = "tf-rds-sql-server-role"
  iam_role_path   = "/service-role/"
  iam_policy_name = "tf-rds-sql-server-policy"

  s3_bucket        = "tf-s3-bucket"
  s3_force_destroy = true
  s3_bucket_prefix = "/${local.aws_region}/${data.aws_caller_identity.current.account_id}"
}
