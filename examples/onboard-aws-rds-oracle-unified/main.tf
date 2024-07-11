locals {
  aws_region = "us-east-2"

  admin_email = "test@example.com"
  gateway_id  = "a1b2c3d4-e5f6-g8h9-wxyz-123456790"

  master_user         = "admin"
  master_password     = "abcd1234"
  audit_pull_user     = "sonarlogaudit"
  audit_pull_password = "abcd1234"
  audit_policy_name   = "testpol"
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
# 1. Method to create audit pull user as well as audit policies
################################################################################
# 1. Run shell script locally to create audit pull user and policies
resource "terraform_data" "configure_database" {
  depends_on = [module.aws-rds-oracle-unified-1]

  provisioner "local-exec" {
    environment = {
      ADMIN_USER     = local.master_user
      ADMIN_PASSWORD = local.master_password
      HOSTNAME       = module.aws-rds-oracle-unified-1.oracle-instance.address
      SID            = module.aws-rds-oracle-unified-1.oracle-instance.db_name
      PORT           = module.aws-rds-oracle-unified-1.oracle-instance.port

      AUDIT_POLICY_NAME   = local.audit_policy_name
      AUDIT_PULL_USERNAME = local.audit_pull_user
      AUDIT_PULL_PASSWORD = local.audit_pull_password
    }

    command = "./configure_database.sh"

    on_failure = fail
  }

}

################################################################################
# AWS RDS Oracle 19
################################################################################
module "aws-rds-oracle-unified-1" {
  source = "../../modules/onboard-aws-rds-oracle-unified"

  aws_rds_oracle_admin_email        = local.admin_email
  aws_rds_oracle_audit_pull_enabled = true
  aws_rds_oracle_auth_mechanism     = "password"
  aws_rds_oracle_gateway_id         = local.gateway_id
  aws_rds_oracle_password           = local.audit_pull_password
  aws_rds_oracle_reason             = "default"
  aws_rds_oracle_username           = local.audit_pull_user

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
module "aws-rds-oracle-unified-2" {
  source = "../../modules/onboard-aws-rds-oracle-unified"

  aws_rds_oracle_admin_email        = local.admin_email
  aws_rds_oracle_audit_pull_enabled = true
  aws_rds_oracle_audit_type         = "UNIFIED_AGGREGATED"
  aws_rds_oracle_auth_mechanism     = "password"
  aws_rds_oracle_gateway_id         = local.gateway_id
  aws_rds_oracle_password           = local.audit_pull_password
  aws_rds_oracle_reason             = "default"
  aws_rds_oracle_username           = local.audit_pull_user

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
