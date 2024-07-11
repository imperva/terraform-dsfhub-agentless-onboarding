module "oracle-parameter-group" {
  source = "../aws-rds-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "oracle-instance" {
  source = "../aws-rds-instance"

  allocated_storage               = var.instance_allocated_storage
  apply_immediately               = var.instance_apply_immediately
  db_name                         = var.instance_db_name
  deletion_protection             = var.instance_deletion_protection
  enabled_cloudwatch_logs_exports = var.instance_enabled_cloudwatch_logs_exports
  engine                          = "oracle-ee"
  engine_version                  = var.instance_engine_version
  final_snapshot_identifier       = var.instance_final_snapshot_identifier
  identifier                      = var.instance_identifier
  instance_class                  = var.instance_instance_class
  max_allocated_storage           = var.instance_max_allocated_storage
  option_group_name               = var.instance_option_group_name
  parameter_group_name            = module.oracle-parameter-group.this.id
  password                        = var.instance_password
  port                            = var.instance_port
  publicly_accessible             = var.instance_publicly_accessible
  skip_final_snapshot             = var.instance_skip_final_snapshot
  subnet_group_name               = var.instance_subnet_group_name
  tags                            = var.instance_tags
  username                        = var.instance_username
  vpc_security_group_ids          = var.instance_vpc_security_group_ids
}

module "oracle-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/instance/${var.instance_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "aws-rds-oracle-asset" {
  source = "../dsfhub-aws-rds-oracle"

  admin_email        = var.aws_rds_oracle_admin_email
  asset_display_name = module.oracle-instance.this.identifier
  asset_id           = module.oracle-instance.this.arn
  audit_type         = var.aws_rds_oracle_audit_type
  gateway_id         = var.aws_rds_oracle_gateway_id
  parent_asset_id    = var.aws_rds_oracle_parent_asset_id
  region             = var.aws_rds_oracle_region
  server_host_name   = module.oracle-instance.this.address
  server_port        = module.oracle-instance.this.port
  service_name       = module.oracle-instance.this.db_name
}

module "aws-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.oracle-log-group.this.arn}:*"
  asset_id           = "${module.oracle-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-oracle-asset.this.asset_id
  region             = var.aws_log_group_region
}
