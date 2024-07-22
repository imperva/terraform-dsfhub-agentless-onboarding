module "aurora-postgresql-cluster" {
  source     = "../aws-rds-cluster"

  apply_immediately                  = var.cluster_apply_immediately
  backup_retention                   = var.cluster_backup_retention
  cluster_id                         = var.cluster_id
  db_enabled_cloudwatch_logs_exports = var.cluster_db_enabled_cloudwatch_logs_exports
  db_engine                          = "aurora-postgresql"
  db_engine_version                  = var.cluster_db_engine_version
  db_master_password                 = var.cluster_db_master_password
  db_master_username                 = var.cluster_db_master_username
  db_port                            = var.cluster_db_port
  db_subnet_group_name               = var.cluster_db_subnet_group_name
  final_snapshot                     = var.cluster_final_snapshot
  maintenance_schedule               = var.cluster_maintenance_schedule
  network_type                       = var.cluster_network_type
  parameter_group_name               = var.cluster_parameter_group_name
  vpc_security_group_ids             = var.cluster_vpc_security_group_ids
}

module "aurora-postgresql-instance" {
  source = "../aws-rds-cluster-instance"

  apply_immediately     = var.instance_apply_immediately
  cluster_id            = module.aurora-postgresql-cluster.this.cluster_identifier
  db_engine             = module.aurora-postgresql-cluster.this.engine
  db_instance_class     = var.instance_class
  db_subnet_group_name  = module.aurora-postgresql-cluster.this.db_subnet_group_name
  identifier            = var.instance_identifier
  maintenance_schedule  = var.instance_maintenance_schedule
  minor_version_upgrade = var.instance_minor_version_upgrade
  publicly_accessible   = var.instance_publicly_accessible
}

module "aws-kms-key" {
  source = "../aws-kms-key"

  custom_master_key_spec  = var.key_custom_master_key_spec
  deletion_window_in_days = var.key_deletion_window_in_days
  description             = var.key_description
  is_enabled              = var.key_is_enabled
  key_usage               = var.key_usage
  multi_region            = var.key_multi_region
  tags                    = var.key_tags
}

module "aurora-postgresql-cluster-activity-stream" {
  source = "../aws-rds-cluster-activity-stream"

  engine_native_audit_fields_included = false
  kms_key_id                          = module.aws-kms-key.this.arn
  mode                                = var.stream_mode
  resource_arn                        = module.aurora-postgresql-cluster.this.arn
}

module "aws-rds-aurora-postgresql-cluster-asset" {
  source = "../dsfhub-aws-rds-aurora-postgresql-cluster"

  admin_email        = var.aws_aurora_postgresql_cluster_admin_email
  asset_display_name = module.aurora-postgresql-cluster.this.id
  asset_id           = module.aurora-postgresql-cluster.this.arn
  audit_type         = var.aws_aurora_postgresql_cluster_audit_type
  gateway_id         = var.aws_aurora_postgresql_cluster_gateway_id
  parent_asset_id    = var.aws_aurora_postgresql_cluster_parent_asset_id
  region             = var.aws_aurora_postgresql_cluster_region
  server_host_name   = module.aurora-postgresql-cluster.this.endpoint
  server_port        = module.aurora-postgresql-cluster.this.port
}

# Collect region and account info for kinesis asset_id
data "aws_region" "current" {}
data "aws_arn" "aurora_postgresql_cluster" {
  arn = module.aurora-postgresql-cluster.this.arn
}

module "aws-kinesis-asset" {
  source = "../dsfhub-aws-kinesis"

  admin_email        = var.aws_kinesis_admin_email
  asset_display_name = "AWS Kinesis - ${module.aurora-postgresql-cluster-activity-stream.this.kinesis_stream_name}"
  asset_id           = "arn:aws:kinesis:${data.aws_region.current.name}:${data.aws_arn.aurora_postgresql_cluster.account}:stream/${module.aurora-postgresql-cluster-activity-stream.this.kinesis_stream_name}"
  audit_pull_enabled = var.aws_kinesis_audit_pull_enabled
  gateway_id         = var.aws_kinesis_gateway_id
  parent_asset_id    = module.aws-rds-aurora-postgresql-cluster-asset.this.asset_id
  reason             = var.aws_kinesis_reason
  region             = var.aws_kinesis_region
}
