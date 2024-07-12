resource "aws_neptune_cluster" "this" {
  cluster_identifier                   = var.identifier
  engine                               = var.engine
  engine_version                       = var.engine_version
  backup_retention_period              = var.backup_retention_period
  skip_final_snapshot                  = var.skip_final_snapshot
  enable_cloudwatch_logs_exports       = var.enable_cloudwatch_logs_exports
  neptune_cluster_parameter_group_name = var.parameter_group_name
  iam_database_authentication_enabled  = var.iam_database_authentication_enabled
  vpc_security_group_ids               = var.vpc_security_group_ids
  neptune_subnet_group_name            = var.neptune_subnet_group_name
  storage_type                         = var.storage_type
  preferred_maintenance_window         = var.preferred_maintenance_window
  apply_immediately                    = var.apply_immediately
}