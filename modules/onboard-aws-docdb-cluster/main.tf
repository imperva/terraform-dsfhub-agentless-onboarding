module "docdb-param-group" {
  source = "../aws-docdb-cluster-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "docdb-cluster" {
  source = "../aws-docdb-cluster"

  depends_on = [module.docdb-log-group]

  apply_immediately               = var.cluster_apply_immediately
  cluster_identifier              = var.cluster_identifier
  db_cluster_parameter_group_name = module.docdb-param-group.this.name
  db_subnet_group_name            = var.cluster_db_subnet_group_name
  deletion_protection             = var.cluster_deletion_protection
  enabled_cloudwatch_logs_exports = var.cluster_enabled_cloudwatch_logs_exports
  engine_version                  = var.cluster_engine_version
  final_snapshot_identifier       = var.cluster_final_snapshot_identifier
  master_password                 = var.cluster_master_password
  master_username                 = var.cluster_master_username
  port                            = var.cluster_port
  skip_final_snapshot             = var.cluster_skip_final_snapshot
  storage_type                    = var.cluster_storage_type
  tags                            = var.cluster_tags
  vpc_security_group_ids          = var.cluster_vpc_security_group_ids
}

module "docdb-cluster-instance" {
  source = "../aws-docdb-cluster-instance"

  depends_on = [module.docdb-cluster]

  apply_immediately  = var.instance_apply_immediately
  cluster_identifier = var.cluster_identifier
  count              = var.instance_count
  instance_class     = var.instance_instance_class
  promotion_tier     = var.instance_promotion_tier
  tags               = var.instance_tags
}

module "docdb-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/docdb/${var.cluster_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "docdb-cluster-asset" {
  source = "../dsfhub-aws-docdb-cluster"

  admin_email        = var.aws_docdb_cluster_admin_email
  asset_display_name = module.docdb-cluster.this.cluster_identifier
  asset_id           = module.docdb-cluster.this.arn
  cluster_identifier = module.docdb-cluster.this.cluster_identifier
  gateway_id         = var.aws_docdb_cluster_gateway_id
  parent_asset_id    = var.aws_docdb_cluster_parent_asset_id
  region             = var.aws_docdb_cluster_region
  server_host_name   = module.docdb-cluster.this.endpoint
  server_ip          = module.docdb-cluster.this.arn
  server_port        = module.docdb-cluster.this.port
}

module "docdb-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.docdb-log-group.this.arn}:*"
  asset_id           = "${module.docdb-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.docdb-cluster-asset.this.asset_id
  reason             = var.aws_log_group_reason
  region             = var.aws_log_group_region
}
