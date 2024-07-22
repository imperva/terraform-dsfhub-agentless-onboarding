resource "aws_rds_cluster_instance" "this" {

  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.minor_version_upgrade
  cluster_identifier           = var.cluster_id
  db_subnet_group_name         = var.db_subnet_group_name
  identifier                   = var.identifier
  instance_class               = var.db_instance_class
  engine                       = var.db_engine
  preferred_maintenance_window = var.maintenance_schedule
  publicly_accessible          = var.publicly_accessible
}
