module "neptune-cluster-parameter-group" {
  source = "../aws-neptune-cluster-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "neptune-cluster" {
  depends_on = [module.neptune-cluster-parameter-group, module.neptune-log-group, module.neptune-log-group-slowquery]

  source = "../aws-neptune-cluster"

  identifier                          = var.cluster_identifier
  engine                              = var.cluster_engine
  engine_version                      = var.cluster_engine_version
  backup_retention_period             = var.cluster_backup_retention_period
  skip_final_snapshot                 = var.cluster_skip_final_snapshot
  enable_cloudwatch_logs_exports      = var.cluster_enable_cloudwatch_logs_exports
  parameter_group_name                = module.neptune-cluster-parameter-group.this.name
  storage_type                        = var.cluster_storage_type
  preferred_maintenance_window        = var.cluster_preferred_maintenance_window
  iam_database_authentication_enabled = var.cluster_iam_database_authentication_enabled
  vpc_security_group_ids              = var.cluster_vpc_security_group_ids
  neptune_subnet_group_name           = var.instance_neptune_subnet_group_name
  apply_immediately                   = var.cluster_apply_immediately
}

module "neptune-instance" {
  depends_on = [module.neptune-cluster]
  source     = "../aws-neptune-instance"

  cluster_identifier           = module.neptune-cluster.this.cluster_identifier
  identifier                   = var.instance_identifier
  class                        = var.instance_class
  port                         = var.instance_port
  publicly_accessible          = var.instance_publicly_accessible
  neptune_subnet_group_name    = var.instance_neptune_subnet_group_name
  neptune_parameter_group_name = var.instance_neptune_parameter_group_name
  auto_minor_version_upgrade   = var.instance_auto_minor_version_upgrade
  apply_immediately            = var.instance_apply_immediately
}

module "neptune-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/neptune/${var.cluster_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "neptune-log-group-slowquery" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/neptune/${var.cluster_identifier}/slowquery"
  retention_in_days = var.log_group_retention_in_days
}

module "aws-neptune-cluster-asset" {
  source = "../dsfhub-aws-neptune-cluster"

  admin_email        = var.aws_neptune_cluster_admin_email
  asset_display_name = module.neptune-cluster.this.id
  asset_id           = module.neptune-cluster.this.arn
  gateway_id         = var.aws_neptune_cluster_gateway_id
  server_host_name   = module.neptune-cluster.this.endpoint
  server_port        = module.neptune-cluster.this.port
  region             = var.aws_neptune_cluster_region
  parent_asset_id    = var.aws_neptune_cluster_parent_asset_id
}

module "aws-log-group-asset" {
  depends_on = [module.aws-neptune-cluster-asset]
  source     = "../dsfhub-aws-log-group"

  admin_email        = var.aws_neptune_cluster_admin_email
  asset_display_name = module.neptune-log-group.this.id
  asset_id           = "${module.neptune-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_neptune_cluster_gateway_id
  parent_asset_id    = module.aws-neptune-cluster-asset.this.asset_id
  audit_type         = "LOG_GROUP"
  region             = var.aws_neptune_cluster_region
}

module "aws-log-group-slowquery-asset" {
  depends_on = [module.aws-neptune-cluster-asset, module.aws-log-group-asset]
  source     = "../dsfhub-aws-log-group"

  admin_email        = var.aws_neptune_cluster_admin_email
  asset_display_name = module.neptune-log-group-slowquery.this.id
  asset_id           = "${module.neptune-log-group-slowquery.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_neptune_cluster_gateway_id
  parent_asset_id    = module.aws-neptune-cluster-asset.this.asset_id
  audit_type         = "AWS_NEPTUNE_SLOW"
  region             = var.aws_neptune_cluster_region
}