locals {
  aws_region        = "us-east-1"
  apply_immediately = true
  master_user       = "admin"
  master_password   = "Abcd1234"

  audit_pull_user     = "sonarlogaudit"
  audit_pull_password = "Abcd1234"

  bucket_name = "tf-s3-bucket"

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

data "aws_caller_identity" "current" {}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# Redshift via ODBC Prerequisites
# 1. Method to create audit pull user
################################################################################
# Runs the shell script locally to create the audit pull user
resource "terraform_data" "configure_database" {
  depends_on = [module.aws-redshift-cluster-1]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      HOSTNAME       = regex("(.*):", module.aws-redshift-cluster-1.redshift-cluster.endpoint)[0]
      DATABASE       = module.aws-redshift-cluster-1.redshift-cluster.database_name
      PORT           = module.aws-redshift-cluster-1.redshift-cluster.port

      AUDIT_PULL_USERNAME = local.audit_pull_user
      AUDIT_PULL_PASSWORD = local.audit_pull_password
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Amazon Redshift Cluster via ODBC
################################################################################
module "aws-redshift-cluster-1" {
  source = "../../modules/onboard-aws-redshift-odbc"

  aws_redshift_admin_email        = local.admin_email
  aws_redshift_audit_pull_enabled = true
  aws_redshift_gateway_id         = local.gateway_id
  aws_redshift_region             = local.aws_region
  aws_redshift_username           = local.audit_pull_user
  aws_redshift_password           = local.audit_pull_password

  redshift_apply_immediately         = local.apply_immediately
  redshift_cluster_identifier        = "tf-redshift"
  redshift_cluster_subnet_group_name = "default"
  redshift_master_password           = local.master_password
  redshift_master_username           = local.master_user
  redshift_skip_final_snapshot       = true
  redshift_vpc_security_group_ids    = ["sg-0123456789abcdefg"]
}

################################################################################
# Redshift via S3 Prerequisites
# 1. AWS cloud account
################################################################################
# 1. AWS cloud account
# Note that the following additional privileges are required for the AWS cloud account:
# s3:GetObject
# s3:ListBucket
# s3:ListAllMyBuckets
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
# Amazon Redshift Cluster via S3
################################################################################
module "aws-redshift-1" {
  source = "../../modules/onboard-aws-redshift-s3"

  aws_redshift_admin_email       = local.admin_email
  aws_redshift_gateway_id        = local.gateway_id
  aws_redshift_parent_asset_id   = module.aws-default-account-asset.this.asset_id
  aws_redshift_region            = local.aws_region
  aws_redshift_bucket_account_id = data.aws_caller_identity.current.account_id

  aws_s3_admin_email        = local.admin_email
  aws_s3_audit_pull_enabled = true
  aws_s3_bucket_account_id  = data.aws_caller_identity.current.account_id
  aws_s3_gateway_id         = local.gateway_id
  aws_s3_parent_asset_id    = module.aws-default-account-asset.this.asset_id
  aws_s3_region             = local.aws_region

  redshift_apply_immediately         = local.apply_immediately
  redshift_cluster_identifier        = "tf-redshift-via-s3"
  redshift_cluster_subnet_group_name = "default"
  redshift_master_password           = local.master_password
  redshift_master_username           = local.master_user
  redshift_skip_final_snapshot       = true
  redshift_vpc_security_group_ids    = ["sg-0123456789abcdefg"]

  parameter_group_name = "tf-redshift-s3-pg"

  s3_bucket = local.bucket_name
}
