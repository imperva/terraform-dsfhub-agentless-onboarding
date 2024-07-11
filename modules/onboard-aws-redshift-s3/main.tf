module "s3-bucket" {
  source = "../aws-s3-bucket"

  bucket              = var.s3_bucket
  force_destroy       = var.s3_force_destroy
  object_lock_enabled = var.s3_object_lock_enabled
  tags                = var.s3_tags
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
    actions = [
      "s3:PutObject",
      "s3:GetBucketAcl"
    ]
    resources = [
      "arn:aws:s3:::${module.s3-bucket.this.bucket}",
      "arn:aws:s3:::${module.s3-bucket.this.bucket}/*"
    ]
  }

}

module "s3-bucket-policy" {
  source = "../aws-s3-bucket-policy"

  bucket = module.s3-bucket.this.bucket
  policy = data.aws_iam_policy_document.s3_policy.json
}

module "redshift-parameter-group" {
  source = "../aws-redshift-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

module "redshift-logging" {
  source = "../aws-redshift-logging"

  depends_on = [module.s3-bucket-policy]

  bucket_name          = module.s3-bucket.this.bucket
  cluster_identifier   = module.redshift-cluster.this.cluster_identifier
  log_destination_type = "s3"
  s3_key_prefix        = "redshift"
}

module "redshift-cluster" {
  source = "../aws-redshift-cluster"

  apply_immediately            = var.redshift_apply_immediately
  cluster_identifier           = var.redshift_cluster_identifier
  cluster_parameter_group_name = module.redshift-parameter-group.this.name
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

  admin_email               = var.aws_redshift_admin_email
  asset_display_name        = module.redshift-cluster.this.cluster_identifier
  asset_id                  = module.redshift-cluster.this.arn
  audit_pull_enabled        = var.aws_redshift_audit_pull_enabled
  audit_type                = "REDSHIFT"
  bucket_account_id         = var.aws_redshift_bucket_account_id
  database_name             = module.redshift-cluster.this.database_name
  gateway_id                = var.aws_redshift_gateway_id
  logs_destination_asset_id = module.s3-bucket-asset.this.asset_id
  parent_asset_id           = var.aws_redshift_parent_asset_id
  region                    = var.aws_redshift_region
  server_host_name          = regex("(.*):", module.redshift-cluster.this.endpoint)[0]
  server_ip                 = regex("(.*):", module.redshift-cluster.this.endpoint)[0]
  server_port               = module.redshift-cluster.this.port
}

module "s3-bucket-asset" {
  source = "../dsfhub-aws-s3-bucket-la"

  admin_email        = var.aws_s3_admin_email
  asset_display_name = var.aws_s3_asset_display_name
  asset_id           = module.s3-bucket.this.arn
  audit_pull_enabled = var.aws_s3_audit_pull_enabled
  audit_type         = "REDSHIFT"
  bucket_account_id  = var.aws_s3_bucket_account_id
  gateway_id         = var.aws_s3_gateway_id
  parent_asset_id    = var.aws_s3_parent_asset_id
  region             = var.aws_s3_region
  server_host_name   = module.s3-bucket.this.id
  server_ip          = module.s3-bucket.this.arn
  server_port        = var.aws_s3_server_port
}
