module "aurora-postgresql-cluster-parameter-group" {
  source = "../aws-rds-cluster-parameter-group"

  description = var.cluster_parameter_group_description
  family      = var.cluster_parameter_group_family
  name        = var.cluster_parameter_group_name
  parameters  = var.cluster_parameter_group_parameters
  tags        = var.cluster_parameter_group_tags
}

module "aurora-postgresql-cluster" {
  depends_on = [module.aurora-postgresql-log-group]
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
  parameter_group_name               = module.aurora-postgresql-cluster-parameter-group.this.name
  vpc_security_group_ids             = var.cluster_vpc_security_group_ids
}

module "aurora-postgresql-instance" {
  source = "../aws-rds-cluster-instance"

  apply_immediately     = var.instance_apply_immediately
  cluster_id            = module.aurora-postgresql-cluster.this.cluster_identifier
  db_engine             = module.aurora-postgresql-cluster.this.engine
  db_instance_class     = var.instance_db_instance_class
  db_subnet_group_name  = module.aurora-postgresql-cluster.this.db_subnet_group_name
  identifier            = var.instance_identifier
  maintenance_schedule  = var.instance_maintenance_schedule
  minor_version_upgrade = var.instance_minor_version_upgrade
  publicly_accessible   = var.instance_publicly_accessible
}

module "aurora-postgresql-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/cluster/${var.cluster_id}/postgresql"
  retention_in_days = var.log_group_retention_in_days
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

module "aws-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.aurora-postgresql-log-group.this.arn}:*"
  asset_id           = "${module.aurora-postgresql-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-aurora-postgresql-cluster-asset.this.asset_id
  reason             = var.aws_log_group_reason
  region             = var.aws_log_group_region
}
