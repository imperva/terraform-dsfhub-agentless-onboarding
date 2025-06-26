module "s3-bucket" {
  source = "../aws-s3-bucket"

  bucket              = var.s3_bucket
  force_destroy       = var.s3_force_destroy
  object_lock_enabled = var.s3_object_lock_enabled
  tags                = var.s3_tags
}

data "aws_iam_policy_document" "rds-policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
  version = "2012-10-17"
}

module "rds-sql-server-role" {
  source = "../aws-iam-role"

  name               = var.iam_role_name
  path               = var.iam_role_path
  assume_role_policy = data.aws_iam_policy_document.rds-policy.json
}

data "aws_iam_policy_document" "rds-sql-server-policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:GetBucketACL",
      "s3:ListBucket",
    ]
    resources = [
      "${module.s3-bucket.this.arn}${var.s3_bucket_prefix}",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload",
      "s3:PutObject",
    ]
    resources = [
      "${module.s3-bucket.this.arn}${var.s3_bucket_prefix}/*",
    ]
  }

  version = "2012-10-17"
}

module "rds-sql-server-policy" {
  source = "../aws-iam-policy"

  description = "RDS SQL Server IAM Policy"
  name        = var.iam_policy_name
  path        = "/service-role/"
  policy      = data.aws_iam_policy_document.rds-sql-server-policy.json
}

module "attach-rds-sql-server-iam-policy" {
  source = "../aws-iam-role-policy-attachment"

  role       = module.rds-sql-server-role.this.name
  policy_arn = module.rds-sql-server-policy.this.arn
}


locals {
  option_group_audit_options = [
    {
      name  = "S3_BUCKET_ARN"
      value = "${module.s3-bucket.this.arn}${var.s3_bucket_prefix}"
    },
    {
      name  = "IAM_ROLE_ARN"
      value = "${module.rds-sql-server-role.this.arn}"
    },
    {
      name  = "ENABLE_COMPRESSION"
      value = "false"
    },
    {
      name  = "RETENTION_TIME"
      value = "24"
    },
  ]
}

module "rds-sql-server-option-group" {
  source = "../aws-rds-option-group"

  description          = var.option_group_description
  engine_name          = var.option_group_engine_name
  major_engine_version = var.option_group_major_engine_version
  name                 = var.option_group_name
  tags                 = var.option_group_tags

  options = concat(
    [
      {
        option_name = "SQLSERVER_AUDIT"

        option_settings = concat(local.option_group_audit_options, var.option_group_additional_audit_option_settings)
      }
    ],
  var.option_group_additional_options)
}

module "rds-sql-server-db" {
  source = "../aws-rds-instance"

  count = var.db_instance_count

  allocated_storage = var.rds_mssql_allocated_storage
  apply_immediately = var.rds_mssql_apply_immediately

  db_name                   = var.rds_mssql_db_name
  deletion_protection       = var.rds_mssql_deletion_protection
  engine                    = module.rds-sql-server-option-group.this.engine_name
  engine_version            = module.rds-sql-server-option-group.this.major_engine_version
  final_snapshot_identifier = var.rds_mssql_final_snapshot_identifier
  identifier                = "${var.rds_mssql_identifier}-${count.index}"
  instance_class            = var.rds_mssql_instance_class
  license_model             = "license-included"
  max_allocated_storage     = var.rds_mssql_max_allocated_storage
  option_group_name         = module.rds-sql-server-option-group.this.name
  password                  = var.rds_mssql_password
  port                      = var.rds_mssql_port
  publicly_accessible       = var.rds_mssql_publicly_accessible
  skip_final_snapshot       = var.rds_mssql_skip_final_snapshot
  subnet_group_name         = var.rds_mssql_subnet_group_name
  tags                      = var.rds_mssql_tags
  username                  = var.rds_mssql_username
  vpc_security_group_ids    = var.rds_mssql_vpc_security_group_ids
}

module "aws-rds-ms-sql-server-asset" {
  source = "../dsfhub-aws-rds-ms-sql-server"

  count = var.db_instance_count

  admin_email               = var.aws_rds_mssql_admin_email
  asset_display_name        = module.rds-sql-server-db[count.index].this.identifier
  asset_id                  = module.rds-sql-server-db[count.index].this.arn
  audit_pull_enabled        = var.aws_rds_mssql_audit_pull_enabled
  db_engine_version         = var.aws_rds_mssql_db_engine_version
  gateway_id                = var.aws_rds_mssql_gateway_id
  logs_destination_asset_id = module.s3-bucket.this.arn
  parent_asset_id           = var.aws_rds_mssql_parent_asset_id
  region                    = var.aws_rds_mssql_region
  server_host_name          = regex("(.*):", module.rds-sql-server-db[count.index].this.endpoint)[0]
  server_port               = module.rds-sql-server-db[count.index].this.port
}

module "s3-bucket-asset" {
  source = "../dsfhub-aws-s3-bucket-la"

  admin_email        = var.aws_s3_admin_email
  asset_display_name = module.s3-bucket.this.id
  asset_id           = module.s3-bucket.this.arn
  audit_pull_enabled = var.aws_s3_audit_pull_enabled
  gateway_id         = var.aws_s3_gateway_id
  parent_asset_id    = var.aws_s3_parent_asset_id
  region             = var.aws_s3_region
  server_host_name   = module.s3-bucket.this.id
  server_port        = var.aws_s3_server_port
  s3_provider        = "aws-rds-mssql"
}
