module "mariadb-option-group" {
  source = "../aws-rds-option-group"

  description          = var.option_group_description
  engine_name          = "mariadb"
  major_engine_version = var.option_group_major_engine_version
  name                 = var.option_group_name
  options              = var.option_group_options
  tags                 = var.option_group_tags
}

module "mariadb-instance" {
  depends_on = [module.mariadb-log-group]

  source = "../aws-rds-instance"

  allocated_storage               = var.instance_allocated_storage
  apply_immediately               = var.instance_apply_immediately
  db_name                         = var.instance_db_name
  deletion_protection             = var.instance_deletion_protection
  enabled_cloudwatch_logs_exports = var.instance_enabled_cloudwatch_logs_exports
  engine                          = "mariadb"
  engine_version                  = var.instance_engine_version
  final_snapshot_identifier       = var.instance_final_snapshot_identifier
  identifier                      = var.instance_identifier
  instance_class                  = var.instance_instance_class
  max_allocated_storage           = var.instance_max_allocated_storage
  option_group_name               = module.mariadb-option-group.this.id
  parameter_group_name            = var.instance_parameter_group_name
  password                        = var.instance_password
  port                            = var.instance_port
  publicly_accessible             = var.instance_publicly_accessible
  skip_final_snapshot             = var.instance_skip_final_snapshot
  subnet_group_name               = var.instance_subnet_group_name
  tags                            = var.instance_tags
  username                        = var.instance_username
  vpc_security_group_ids          = var.instance_vpc_security_group_ids
}

module "mariadb-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/rds/instance/${var.instance_identifier}/audit"
  retention_in_days = var.log_group_retention_in_days
}

module "aws-rds-mariadb-asset" {
  source = "../dsfhub-aws-rds-mariadb"

  admin_email        = var.aws_rds_mariadb_admin_email
  asset_display_name = module.mariadb-instance.this.identifier
  asset_id           = module.mariadb-instance.this.arn
  database_name      = module.mariadb-instance.this.db_name
  gateway_id         = var.aws_rds_mariadb_gateway_id
  parent_asset_id    = var.aws_rds_mariadb_parent_asset_id
  region             = var.aws_rds_mariadb_region
  server_host_name   = module.mariadb-instance.this.address
  server_port        = module.mariadb-instance.this.port
}

module "aws-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.mariadb-log-group.this.arn}:*"
  asset_id           = "${module.mariadb-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-rds-mariadb-asset.this.asset_id
  region             = var.aws_log_group_region
}
