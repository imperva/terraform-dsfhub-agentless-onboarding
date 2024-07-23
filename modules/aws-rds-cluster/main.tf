resource "aws_rds_cluster" "this" {
  apply_immediately               = var.apply_immediately
  backup_retention_period         = var.backup_retention
  cluster_identifier              = var.cluster_id
  enabled_cloudwatch_logs_exports = var.db_enabled_cloudwatch_logs_exports
  engine                          = var.db_engine
  engine_version                  = var.db_engine_version
  master_password                 = var.db_master_password
  master_username                 = var.db_master_username
  port                            = var.db_port
  db_subnet_group_name            = var.db_subnet_group_name
  skip_final_snapshot             = var.final_snapshot
  preferred_maintenance_window    = var.maintenance_schedule
  db_cluster_parameter_group_name = var.parameter_group_name
  network_type                    = var.network_type
  vpc_security_group_ids          = var.vpc_security_group_ids
}
