resource "aws_rds_cluster" "this" {

  # Cluster settings
  cluster_identifier           = var.cluster_id
  engine                       = var.db_engine
  engine_version               = var.db_engine_version
  port                         = var.db_port
  backup_retention_period      = var.backup_retention
  preferred_maintenance_window = var.maintenance_schedule
  skip_final_snapshot          = var.final_snapshot

  # credentials 
  master_username = var.db_master_username
  master_password = var.db_master_password

  # network
  network_type           = var.network_type
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  # audit
  enabled_cloudwatch_logs_exports = var.db_enabled_cloudwatch_logs_exports
  db_cluster_parameter_group_name = var.parameter_group_name
  apply_immediately               = var.apply_immediately
}
