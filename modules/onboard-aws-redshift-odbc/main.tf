module "redshift-cluster" {
  source = "../aws-redshift-cluster"

  apply_immediately            = var.redshift_apply_immediately
  cluster_identifier           = var.redshift_cluster_identifier
  cluster_subnet_group_name    = var.redshift_cluster_subnet_group_name
  cluster_type                 = var.redshift_cluster_type
  cluster_version              = var.redshift_cluster_version
  database_name                = var.redshift_database_name
  default_iam_role_arn         = var.redshift_default_iam_role_arn
  elastic_ip                   = var.redshift_elastic_ip
  final_snapshot_identifier    = var.redshift_final_snapshot_identifier
  iam_roles                    = var.redshift_iam_roles
  master_password              = var.redshift_master_password
  master_username              = var.redshift_master_username
  node_type                    = var.redshift_node_type
  number_of_nodes              = var.redshift_number_of_nodes
  port                         = var.redshift_port
  preferred_maintenance_window = var.redshift_preferred_maintenance_window
  publicly_accessible          = var.redshift_publicly_accessible
  skip_final_snapshot          = var.redshift_skip_final_snapshot
  snapshot_cluster_identifier  = var.redshift_snapshot_cluster_identifier
  snapshot_identifier          = var.redshift_snapshot_identifier
  vpc_security_group_ids       = var.redshift_vpc_security_group_ids
  tags                         = var.redshift_tags
}

module "redshift-asset" {
  source = "../dsfhub-aws-redshift-cluster"

  admin_email        = var.aws_redshift_admin_email
  asset_display_name = module.redshift-cluster.this.cluster_identifier
  asset_id           = module.redshift-cluster.this.arn
  audit_pull_enabled = var.aws_redshift_audit_pull_enabled
  audit_type         = "TABLE"
  database_name      = module.redshift-cluster.this.database_name
  gateway_id         = var.aws_redshift_gateway_id
  parent_asset_id    = var.aws_redshift_parent_asset_id
  region             = var.aws_redshift_region
  server_host_name   = regex("(.*):", module.redshift-cluster.this.endpoint)[0]
  server_ip          = regex("(.*):", module.redshift-cluster.this.endpoint)[0]
  server_port        = module.redshift-cluster.this.port
  service_name       = module.redshift-cluster.this.database_name

  auth_mechanism = "password"
  username       = var.aws_redshift_username
  password       = var.aws_redshift_password
  ssl            = var.aws_redshift_ssl
}
