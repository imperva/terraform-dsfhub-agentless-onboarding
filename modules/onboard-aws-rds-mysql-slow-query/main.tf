module "mysql-option-group" {
  source = "../aws-rds-option-group"

  description          = var.option_group_description
  engine_name          = "mysql"
  major_engine_version = var.option_group_major_engine_version
  name                 = var.option_group_name
  options              = var.option_group_options
  tags                 = var.option_group_tags
}

module "mysql-parameter-group" {
  source = "../aws-rds-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "mysql-instance" {
  depends_on = [module.mysql-audit-log-group, module.mysql-slow-query-log-group]

  source = "../aws-rds-instance"

  allocated_storage               = var.instance_allocated_storage
  apply_immediately               = var.instance_apply_immediately
  db_name                         = var.instance_db_name
  deletion_protection             = var.instance_deletion_protection
  enabled_cloudwatch_logs_exports = var.instance_enabled_cloudwatch_logs_exports
  engine                          = "mysql"
  engine_version                  = var.instance_engine_version
  final_snapshot_identifier       = var.instance_final_snapshot_identifier
  identifier                      = var.instance_identifier
  instance_class                  = var.instance_instance_class
  max_allocated_storage           = var.instance_max_allocated_storage
  option_group_name               = module.mysql-option-group.this.id
  parameter_group_name            = module.mysql-parameter-group.this.name
  password                        = var.instance_password
  port                            = var.instance_port
  publicly_accessible             = var.instance_publicly_accessible
  skip_final_snapshot             = var.instance_skip_final_snapshot
  subnet_group_name               = var.instance_subnet_group_name
  tags                            = var.instance_tags
  username                        = var.instance_username
  vpc_security_group_ids          = var.instance_vpc_security_group_ids
}

module "mysql-audit-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/instance/${var.instance_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "mysql-slow-query-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/instance/${var.instance_identifier}/slowquery"
  retention_in_days = var.log_group_retention_in_days
}

module "aws-rds-mysql-asset" {
  source = "../dsfhub-aws-rds-mysql"

  admin_email        = var.aws_rds_mysql_admin_email
  asset_display_name = module.mysql-instance.this.identifier
  asset_id           = module.mysql-instance.this.arn
  audit_type         = var.aws_rds_mysql_audit_type
  database_name      = module.mysql-instance.this.db_name
  gateway_id         = var.aws_rds_mysql_gateway_id
  parent_asset_id    = var.aws_rds_mysql_parent_asset_id
  region             = var.aws_rds_mysql_region
  server_host_name   = module.mysql-instance.this.address
  server_port        = module.mysql-instance.this.port
}

module "aws-log-group-audit-asset" {
  depends_on = [module.aws-rds-mysql-asset]
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.mysql-audit-log-group.this.arn}:*"
  asset_id           = "${module.mysql-audit-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-mysql-asset.this.asset_id
  region             = var.aws_log_group_region
}

module "aws-log-group-slow-query-asset" {
  depends_on = [module.aws-log-group-audit-asset]

  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.mysql-slow-query-log-group.this.arn}:*"
  asset_id           = "${module.mysql-slow-query-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  audit_type         = "AWS_RDS_MYSQL_SLOW"
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-mysql-asset.this.asset_id
  region             = var.aws_log_group_region
}
