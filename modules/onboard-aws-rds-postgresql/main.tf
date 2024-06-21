module "postgres-parameter-group" {
  source = "../aws-rds-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "postgres-instance" {
  depends_on = [module.postgres-log-group]

  source = "../aws-rds-instance"

  allocated_storage               = var.instance_allocated_storage
  apply_immediately               = var.instance_apply_immediately
  db_name                         = var.instance_db_name
  deletion_protection             = var.instance_deletion_protection
  enabled_cloudwatch_logs_exports = var.instance_enabled_cloudwatch_logs_exports
  engine                          = var.instance_engine
  engine_version                  = var.instance_engine_version
  final_snapshot_identifier       = var.instance_final_snapshot_identifier
  identifier                      = var.instance_identifier
  instance_class                  = var.instance_instance_class
  max_allocated_storage           = var.instance_max_allocated_storage
  option_group_name               = var.instance_option_group_name
  parameter_group_name            = module.postgres-parameter-group.this.name
  password                        = var.instance_password
  port                            = var.instance_port
  publicly_accessible             = var.instance_publicly_accessible
  skip_final_snapshot             = var.instance_skip_final_snapshot
  subnet_group_name               = var.instance_subnet_group_name
  tags                            = var.instance_tags
  username                        = var.instance_username
  vpc_security_group_ids          = var.instance_vpc_security_group_ids
}

module "postgres-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/instance/${var.instance_identifier}/postgresql"
  retention_in_days = var.log_group_retention_in_days
}

module "aws-rds-postgresql-asset" {
  source = "../dsfhub-aws-rds-postgresql"

  admin_email        = var.aws_rds_postgresql_admin_email
  asset_display_name = module.postgres-instance.this.identifier
  asset_id           = module.postgres-instance.this.arn
  audit_type         = var.aws_rds_postgresql_audit_type
  database_name      = module.postgres-instance.this.db_name
  gateway_id         = var.aws_rds_postgresql_gateway_id
  parent_asset_id    = var.aws_rds_postgresql_parent_asset_id
  region             = var.aws_rds_postgresql_region
  server_host_name   = module.postgres-instance.this.address
  server_port        = module.postgres-instance.this.port
}

module "aws-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.postgres-log-group.this.arn}:*"
  asset_id           = "${module.postgres-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-postgresql-asset.this.asset_id
  reason             = var.aws_log_group_reason
  region             = var.aws_log_group_region
}
