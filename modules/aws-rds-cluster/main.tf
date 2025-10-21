resource "aws_rds_cluster" "this" {
  apply_immediately               = var.apply_immediately
  backup_retention_period         = var.backup_retention_period
  cluster_identifier              = var.cluster_identifier
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  db_subnet_group_name            = var.db_subnet_group_name
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  engine                          = var.engine
  engine_mode                     = var.engine_mode
  engine_version                  = var.engine_version
  master_password                 = var.master_password
  master_username                 = var.master_username
  network_type                    = var.network_type
  port                            = var.port
  preferred_maintenance_window    = var.preferred_maintenance_window
  skip_final_snapshot             = var.skip_final_snapshot
  storage_encrypted               = var.storage_encrypted
  vpc_security_group_ids          = var.vpc_security_group_ids
}
