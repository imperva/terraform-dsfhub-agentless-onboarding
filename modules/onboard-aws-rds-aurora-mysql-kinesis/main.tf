module "aurora-mysql-cluster" {
  source = "../aws-rds-cluster"

  apply_immediately               = var.cluster_apply_immediately
  backup_retention_period         = var.cluster_backup_retention_period
  cluster_identifier              = var.cluster_identifier
  db_cluster_parameter_group_name = var.cluster_parameter_group_name
  db_subnet_group_name            = var.cluster_db_subnet_group_name
  enabled_cloudwatch_logs_exports = var.cluster_enabled_cloudwatch_logs_exports
  engine                          = "aurora-mysql"
  engine_version                  = var.cluster_engine_version
  master_password                 = var.cluster_master_password
  master_username                 = var.cluster_master_username
  network_type                    = var.cluster_network_type
  port                            = var.cluster_port
  preferred_maintenance_window    = var.cluster_preferred_maintenance_window
  skip_final_snapshot             = var.cluster_skip_final_snapshot
  vpc_security_group_ids          = var.cluster_vpc_security_group_ids
}

module "aurora-mysql-instance" {
  source = "../aws-rds-cluster-instance"

  apply_immediately     = var.instance_apply_immediately
  cluster_id            = module.aurora-mysql-cluster.this.cluster_identifier
  db_engine             = "aurora-mysql"
  db_instance_class     = var.db_instance_class
  db_subnet_group_name  = module.aurora-mysql-cluster.this.db_subnet_group_name
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

module "aurora-mysql-cluster-activity-stream" {
  source = "../aws-rds-cluster-activity-stream"

  engine_native_audit_fields_included = false
  kms_key_id                          = module.aws-kms-key.this.arn
  mode                                = var.stream_mode
  resource_arn                        = module.aurora-mysql-cluster.this.arn
}

module "aws-rds-aurora-mysql-cluster-asset" {
  source = "../dsfhub-aws-rds-aurora-mysql-cluster"

  admin_email        = var.aws_aurora_mysql_cluster_admin_email
  asset_display_name = module.aurora-mysql-cluster.this.cluster_identifier
  asset_id           = module.aurora-mysql-cluster.this.arn
  gateway_id         = var.aws_aurora_mysql_cluster_gateway_id
  parent_asset_id    = var.aws_aurora_mysql_cluster_parent_asset_id
  region             = var.aws_aurora_mysql_cluster_region
  server_host_name   = module.aurora-mysql-cluster.this.endpoint
  server_port        = module.aurora-mysql-cluster.this.port
}

# Collect region and account info for kinesis asset_id
data "aws_region" "current" {}
data "aws_arn" "aurora_mysql_cluster" {
  arn = module.aurora-mysql-cluster.this.arn
}

module "aws-kinesis-asset" {
  source = "../dsfhub-aws-kinesis"

  admin_email        = var.aws_kinesis_admin_email
  asset_display_name = "AWS Kinesis - ${module.aurora-mysql-cluster-activity-stream.this.kinesis_stream_name}"
  asset_id           = "arn:aws:kinesis:${data.aws_region.current.name}:${data.aws_arn.aurora_mysql_cluster.account}:stream/${module.aurora-mysql-cluster-activity-stream.this.kinesis_stream_name}"
  audit_pull_enabled = var.aws_kinesis_audit_pull_enabled
  audit_type         = "KINESIS"
  gateway_id         = var.aws_kinesis_gateway_id
  parent_asset_id    = module.aws-rds-aurora-mysql-cluster-asset.this.asset_id
  reason             = var.aws_kinesis_reason
  region             = var.aws_kinesis_region
}
