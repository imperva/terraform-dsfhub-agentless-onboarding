resource "aws_redshift_cluster" "this" {
  apply_immediately            = var.apply_immediately
  cluster_identifier           = var.cluster_identifier
  cluster_parameter_group_name = var.cluster_parameter_group_name
  cluster_subnet_group_name    = var.cluster_subnet_group_name
  cluster_type                 = var.cluster_type
  cluster_version              = var.cluster_version
  database_name                = var.database_name
  default_iam_role_arn         = var.default_iam_role_arn
  elastic_ip                   = var.elastic_ip
  final_snapshot_identifier    = var.final_snapshot_identifier
  iam_roles                    = var.iam_roles
  master_password              = var.master_password
  master_username              = var.master_username
  node_type                    = var.node_type
  number_of_nodes              = var.number_of_nodes
  port                         = var.port
  preferred_maintenance_window = var.preferred_maintenance_window
  publicly_accessible          = var.publicly_accessible
  skip_final_snapshot          = var.skip_final_snapshot
  snapshot_cluster_identifier  = var.snapshot_cluster_identifier
  snapshot_identifier          = var.snapshot_identifier
  tags                         = var.tags
  vpc_security_group_ids       = var.vpc_security_group_ids
}
