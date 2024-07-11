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
# 2. Method to create 'pgaudit' extension and 'rds_pgaudit' role on the postgres
#    instance.
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

# 2. Run shell script locally to create extension and role on the newly created
#    postgres instance. 
resource "terraform_data" "configure_database" {
  depends_on = [module.aws-rds-postgresql-1]

  provisioner "local-exec" {
    environment = {
      PGHOST     = module.aws-rds-postgresql-1.postgres-instance.address
      PGUSER     = "admin"
      PGPASSWORD = "abcd1234"
      PGPORT     = module.aws-rds-postgresql-1.postgres-instance.port
      PGDATABASE = module.aws-rds-postgresql-1.postgres-instance.db_name
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Amazon RDS for PostgreSQL 16.0
################################################################################
module "aws-rds-postgresql-1" {
  source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-postgresql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.admin_email
  aws_log_group_region             = local.aws_region

  aws_rds_postgresql_admin_email     = local.admin_email
  aws_rds_postgresql_gateway_id      = local.gateway_id
  aws_rds_postgresql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_postgresql_region          = local.aws_region

  instance_db_name             = "testdb"
  instance_engine              = "postgres"
  instance_engine_version      = "16"
  instance_identifier          = "example-tf-postgres-16"
  instance_instance_class      = "db.t3.small"
  instance_password            = "abcd1234"
  instance_publicly_accessible = true
  instance_skip_final_snapshot = true
  instance_subnet_group_name   = "default"
  instance_username            = "admin"
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "postgres16"
  parameter_group_name   = "example-tf-postgres-16-pg"
}

################################################################################
# Amazon RDS for PostgreSQL 16.0 w/ Slow Query
################################################################################
module "aws-rds-postgresql-2" {
  source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-postgresql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_postgresql_admin_email     = local.admin_email
  aws_rds_postgresql_gateway_id      = local.gateway_id
  aws_rds_postgresql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_postgresql_region          = local.aws_region

  instance_db_name             = "testdb"
  instance_engine              = "postgres"
  instance_engine_version      = "16"
  instance_identifier          = "example-tf-postgres-16"
  instance_instance_class      = "db.t3.small"
  instance_password            = "abcd1234"
  instance_publicly_accessible = true
  instance_skip_final_snapshot = true
  instance_subnet_group_name   = "default"
  instance_username            = "admin"
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "postgres16"
  parameter_group_name   = "example-tf-postgres-16-pg"
  parameter_group_parameters = [
    {
      name  = "log_connections"
      value = 1
    },
    {
      name  = "log_disconnections"
      value = 1
    },
    {
      name  = "log_error_verbosity"
      value = "verbose"
    },
    {
      name  = "pgaudit.role"
      value = "rds_pgaudit"
    },
    {
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name         = "shared_preload_libraries"
      value        = "pgaudit"
      apply_method = "pending-reboot"
    },
    {
      name  = "log_min_duration_statement"
      value = 60
    }
  ]
}

################################################################################
# Amazon RDS for PostgreSQL 15.0 Aggregated
################################################################################
module "aws-rds-postgresql-3" {
  source = "imperva/agentless-onboarding/dsfhub//modules/onboard-aws-rds-postgresql"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  aws_rds_postgresql_admin_email     = local.admin_email
  aws_rds_postgresql_audit_type      = "AGGREGATED"
  aws_rds_postgresql_gateway_id      = local.gateway_id
  aws_rds_postgresql_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_rds_postgresql_region          = local.aws_region

  instance_db_name             = "testdb"
  instance_engine              = "postgres"
  instance_engine_version      = "15"
  instance_identifier          = "example-tf-postgres-15"
  instance_instance_class      = "db.t3.small"
  instance_password            = "abcd1234"
  instance_publicly_accessible = true
  instance_skip_final_snapshot = true
  instance_subnet_group_name   = "default"
  instance_username            = "admin"
  instance_vpc_security_group_ids = [
    "sg-0123456789abcdefg"
  ]

  parameter_group_family = "postgres15"
  parameter_group_name   = "example-tf-postgres-15-pg"
}
