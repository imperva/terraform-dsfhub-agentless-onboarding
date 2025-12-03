resource "aws_docdb_cluster" "this" {

  apply_immediately = var.apply_immediately

  cluster_identifier              = var.cluster_identifier
  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name
  db_subnet_group_name            = var.db_subnet_group_name
  deletion_protection             = var.deletion_protection
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  engine                          = "docdb"
  engine_version                  = var.engine_version
  final_snapshot_identifier       = var.final_snapshot_identifier
  master_password                 = var.master_password
  master_username                 = var.master_username
  port                            = var.port
  skip_final_snapshot             = var.skip_final_snapshot
  storage_encrypted               = var.storage_encrypted
  storage_type                    = var.storage_type
  tags                            = var.tags
  vpc_security_group_ids          = var.vpc_security_group_ids
}
