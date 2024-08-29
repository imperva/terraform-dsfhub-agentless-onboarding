module "aurora-mysql-cluster-parameter-group" {
  source = "../aws-rds-cluster-parameter-group"

  description = var.cluster_parameter_group_description
  family      = var.cluster_parameter_group_family
  name        = var.cluster_parameter_group_name
  parameters  = var.cluster_parameter_group_parameters
  tags        = var.cluster_parameter_group_tags
}

module "aurora-mysql-cluster" {
  depends_on = [module.aurora-mysql-cluster-parameter-group, module.aurora-mysql-log-group]
  source     = "../aws-rds-cluster"

  apply_immediately               = var.cluster_apply_immediately
  backup_retention_period         = var.cluster_backup_retention_period
  cluster_identifier              = var.cluster_identifier
  db_cluster_parameter_group_name = module.aurora-mysql-cluster-parameter-group.this.name
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

module "aurora-mysql-instances" {
  depends_on = [module.aurora-mysql-cluster]
  source     = "../aws-rds-cluster-instance"

  apply_immediately     = var.cluster_apply_immediately
  cluster_id            = module.aurora-mysql-cluster.this.cluster_identifier
  db_engine             = module.aurora-mysql-cluster.this.engine
  db_subnet_group_name  = module.aurora-mysql-cluster.this.db_subnet_group_name
  db_instance_class     = var.instance_db_instance_class
  identifier            = var.instance_identifier
  minor_version_upgrade = var.instance_minor_version_upgrade
  maintenance_schedule  = var.cluster_preferred_maintenance_window
  publicly_accessible   = var.instance_publicly_accessible
}

module "aurora-mysql-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/cluster/${var.cluster_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "aurora-mysql-log-group-slowquery" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/cluster/${var.cluster_identifier}/slowquery"
  retention_in_days = var.log_group_retention_in_days
}


module "aws-rds-aurora-mysql-cluster-asset" {
  source = "../dsfhub-aws-rds-aurora-mysql-cluster"

  admin_email        = var.aws_aurora_mysql_cluster_admin_email
  asset_display_name = module.aurora-mysql-cluster.this.id
  asset_id           = module.aurora-mysql-cluster.this.arn
  gateway_id         = var.aws_aurora_mysql_cluster_gateway_id
  server_host_name   = module.aurora-mysql-cluster.this.endpoint
  parent_asset_id    = var.aws_aurora_mysql_cluster_parent_asset_id
  region             = var.aws_aurora_mysql_cluster_region
  server_port        = module.aurora-mysql-cluster.this.port
  username           = module.aurora-mysql-cluster.this.master_username
  password           = module.aurora-mysql-cluster.this.master_password
}

module "aws-log-group-asset" {
  depends_on = [module.aws-rds-aurora-mysql-cluster-asset]
  source     = "../dsfhub-aws-log-group"

  admin_email        = var.aws_aurora_mysql_cluster_admin_email
  asset_display_name = module.aurora-mysql-log-group.this.id
  asset_id           = "${module.aurora-mysql-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_aurora_mysql_cluster_gateway_id
  parent_asset_id    = module.aws-rds-aurora-mysql-cluster-asset.this.asset_id
  audit_type         = var.aws_log_group_audit_type
  region             = var.aws_aurora_mysql_cluster_region
}

module "aws-log-group-slowquery-asset" {
  depends_on = [module.aws-rds-aurora-mysql-cluster-asset, module.aws-log-group-asset]
  source     = "../dsfhub-aws-log-group"

  admin_email        = var.aws_aurora_mysql_cluster_admin_email
  asset_display_name = module.aurora-mysql-log-group-slowquery.this.id
  asset_id           = "${module.aurora-mysql-log-group-slowquery.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_aurora_mysql_cluster_gateway_id
  parent_asset_id    = module.aws-rds-aurora-mysql-cluster-asset.this.asset_id
  audit_type         = "AWS_RDS_AURORA_MYSQL_SLOW"
  region             = var.aws_aurora_mysql_cluster_region
}

