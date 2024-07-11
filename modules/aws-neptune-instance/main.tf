resource "aws_neptune_cluster_instance" "this" {
  cluster_identifier           = var.cluster_identifier
  identifier                   = var.identifier
  instance_class               = var.class
  port                         = var.port
  publicly_accessible          = var.publicly_accessible
  neptune_subnet_group_name    = var.neptune_subnet_group_name
  neptune_parameter_group_name = var.neptune_parameter_group_name
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  apply_immediately            = var.apply_immediately
}