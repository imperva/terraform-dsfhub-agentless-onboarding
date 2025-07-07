locals {
  aws_region = "us-east-2"

  s3_available_bucket_account_ids = [
    "0123456789012",
    "0123456789013"
  ]
  s3_available_regions = [
    "us-east-1",
    "us-west-2"
  ]

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  master_user     = "admin"
  master_password = "abcd1234"

  many_to_one_postfixes = [
    "dev",
    "prod",
    "uat",
  ]

  subnet_group_name = "default"
  vpc_security_group_ids = [
    "sg-0123456789abcdefg",
    "sg-0123456789abcdefh",
  ]
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
# 1. Example AWS cloud account
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
      HOSTNAME       = module.aws-rds-oracle-standard-1.oracle-instance[0].address
      SID            = module.aws-rds-oracle-standard-1.oracle-instance[0].db_name
      PORT           = module.aws-rds-oracle-standard-1.oracle-instance[0].port
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# AWS RDS Oracle 19
################################################################################
module "aws-rds-oracle-standard-1" {
  source = "../../modules/onboard-aws-rds-oracle-standard-s3"

  aws_rds_oracle_admin_email        = local.admin_email
  aws_rds_oracle_gateway_id         = local.gateway_id
  aws_rds_oracle_audit_pull_enabled = true
  aws_rds_oracle_parent_asset_id    = module.aws-key-pair-account-asset.this.asset_id
  aws_rds_oracle_region             = local.aws_region

  aws_s3_admin_email                  = local.admin_email
  aws_s3_available_bucket_account_ids = local.s3_available_bucket_account_ids
  aws_s3_available_regions            = local.s3_available_regions
  aws_s3_gateway_id                   = local.gateway_id
  aws_s3_audit_pull_enabled           = true
  aws_s3_parent_asset_id              = module.aws-key-pair-account-asset.this.asset_id

  instance_engine_version         = "19"
  instance_identifier             = "example-tf-oracle-19"
  instance_password               = local.master_password
  instance_subnet_group_name      = local.subnet_group_name
  instance_username               = local.master_user
  instance_vpc_security_group_ids = local.vpc_security_group_ids

  parameter_group_family = "oracle-ee-19"
  parameter_group_name   = "example-tf-oracle-19-pg"

  firehose_name = "example-tf-firehose"

  s3_bucket        = "example-tf-s3-bucket"
  s3_force_destroy = false
}

################################################################################
# AWS RDS Oracle 19 many-to-one-monitoring
################################################################################
resource "terraform_data" "configure_database_multi" {
  depends_on = [module.aws-rds-oracle-standard-multi]

  count = length(module.aws-rds-oracle-standard-multi.oracle-instance)

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      HOSTNAME       = module.aws-rds-oracle-standard-multi.oracle-instance[count.index].address
      SID            = module.aws-rds-oracle-standard-multi.oracle-instance[count.index].db_name
      PORT           = module.aws-rds-oracle-standard-multi.oracle-instance[count.index].port
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

module "aws-rds-oracle-standard-multi" {
  source = "../../modules/onboard-aws-rds-oracle-standard-s3"

  aws_rds_oracle_admin_email        = local.admin_email
  aws_rds_oracle_gateway_id         = local.gateway_id
  aws_rds_oracle_audit_pull_enabled = true
  aws_rds_oracle_parent_asset_id    = module.aws-key-pair-account-asset.this.asset_id
  aws_rds_oracle_region             = local.aws_region

  aws_s3_admin_email                  = local.admin_email
  aws_s3_available_bucket_account_ids = local.s3_available_bucket_account_ids
  aws_s3_available_regions            = local.s3_available_regions
  aws_s3_gateway_id                   = local.gateway_id
  aws_s3_audit_pull_enabled           = true
  aws_s3_parent_asset_id              = module.aws-key-pair-account-asset.this.asset_id

  instance_count                  = length(local.many_to_one_postfixes)
  instance_engine_version         = "19"
  instance_identifier             = "example-tf-oracle-s3-multi"
  instance_identifier_postfixes   = local.many_to_one_postfixes
  instance_password               = local.master_password
  instance_subnet_group_name      = local.subnet_group_name
  instance_username               = local.master_user
  instance_vpc_security_group_ids = local.vpc_security_group_ids

  parameter_group_family = "oracle-ee-19"
  parameter_group_name   = "example-tf-oracle-19-pg-multi"

  firehose_name                               = "example-tf-firehose-multi"
  firehose_cloudwatch_logging_enabled         = true
  firehose_cloudwatch_logging_log_group_name  = "/aws/kinesisfirehose/example-tf-firehose-multi"
  firehose_cloudwatch_logging_log_stream_name = "DestinationDelivery"

  s3_bucket        = "example-tf-s3-bucket-multi"
  s3_force_destroy = false
}
