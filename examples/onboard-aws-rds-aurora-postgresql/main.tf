locals {
  aws_region          = "us-east-2"
  apply_immediately   = true
  master_user         = "PGadmin"
  master_password     = "Abcd1234"
  subnet_group_name   = "default"
  vpc_security_groups = ["sg-0123456789abcdefg"]

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
#    cluster.
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
#    postgres cluster.
resource "terraform_data" "configure_database" {
  depends_on = [module.aurora-postgresql-1]

  provisioner "local-exec" {
    environment = {
      PGHOST     = module.aurora-postgresql-1.cluster.endpoint
      PGUSER     = local.master_user
      PGPASSWORD = local.master_password
      PGPORT     = module.aurora-postgresql-1.cluster.port
      PGDATABASE = "postgres"
    }

    command = "./configure_database.sh"

    on_failure = fail
  }
}

################################################################################
# Amazon Aurora PostgreSQL 16.1
################################################################################
module "aurora-postgresql-1" {
  source = "../../modules/onboard-aws-rds-aurora-postgresql"

  aws_aurora_postgresql_cluster_admin_email     = local.admin_email
  aws_aurora_postgresql_cluster_gateway_id      = local.gateway_id
  aws_aurora_postgresql_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_aurora_postgresql_cluster_region          = local.aws_region

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  cluster_db_subnet_group_name   = local.subnet_group_name
  cluster_engine_version         = "16.1"
  cluster_identifier             = "tf-aurora-postgresql-cluster"
  cluster_master_password        = local.master_password
  cluster_master_username        = local.master_user
  cluster_parameter_group_name   = "tf-aurora-postgresql-instance-pg"
  cluster_vpc_security_group_ids = local.vpc_security_groups

  instance_apply_immediately   = local.apply_immediately
  instance_identifier          = "tf-aurora-postgresql-instance"
  instance_publicly_accessible = true
}

################################################################################
# Amazon Aurora PostgreSQL 16.1 Aggregated
################################################################################
module "aurora-postgresql-2" {
  source = "../../modules/onboard-aws-rds-aurora-postgresql"

  aws_aurora_postgresql_cluster_admin_email     = local.admin_email
  aws_aurora_postgresql_cluster_audit_type      = "AGGREGATED"
  aws_aurora_postgresql_cluster_gateway_id      = local.gateway_id
  aws_aurora_postgresql_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_aurora_postgresql_cluster_region          = local.aws_region

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  cluster_db_subnet_group_name   = local.subnet_group_name
  cluster_engine_version         = "16.1"
  cluster_identifier             = "tf-aurora-postgresql-cluster"
  cluster_master_password        = local.master_password
  cluster_master_username        = local.master_user
  cluster_parameter_group_name   = "tf-aurora-postgresql-instance-pg"
  cluster_vpc_security_group_ids = local.vpc_security_groups

  instance_apply_immediately   = local.apply_immediately
  instance_identifier          = "tf-aurora-postgresql-instance"
  instance_publicly_accessible = true
}

################################################################################
# Amazon Aurora PostgreSQL 16.1 with Slow Query
################################################################################
module "aurora-postgresql-3" {
  source = "../../modules/onboard-aws-rds-aurora-postgresql"

  aws_aurora_postgresql_cluster_admin_email     = local.admin_email
  aws_aurora_postgresql_cluster_gateway_id      = local.gateway_id
  aws_aurora_postgresql_cluster_parent_asset_id = module.aws-default-account-asset.this.asset_id
  aws_aurora_postgresql_cluster_region          = local.aws_region

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_region             = local.aws_region

  cluster_db_subnet_group_name = local.subnet_group_name
  cluster_engine_version       = "16.1"
  cluster_identifier           = "tf-aurora-postgresql-cluster"
  cluster_master_password      = local.master_password
  cluster_master_username      = local.master_user
  cluster_parameter_group_name = "tf-aurora-postgresql-instance-pg"
  cluster_parameter_group_parameters = [
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
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name  = "pgaudit.role"
      value = "rds_pgaudit"
    },
    {
      name         = "shared_preload_libraries"
      value        = "pgaudit,pg_stat_statements"
      apply_method = "pending-reboot"
    },
    {
      name  = "log_min_duration_statement"
      value = 10000
    }
  ]
  cluster_vpc_security_group_ids = local.vpc_security_groups

  instance_apply_immediately   = local.apply_immediately
  instance_identifier          = "tf-aurora-postgresql-instance"
  instance_publicly_accessible = true
}
