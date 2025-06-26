# Collect AWS region & account info
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

module "oracle-parameter-group" {
  source = "../aws-rds-parameter-group"

  description = var.parameter_group_description
  family      = var.parameter_group_family
  name        = var.parameter_group_name
  parameters  = var.parameter_group_parameters
  tags        = var.parameter_group_tags
}

# For supporting many-to-one monitoring
locals {
  # If instance_count is 1, we don't need postfixes, so we set it to null
  # If instance_count is greater than 1, we use instance_identifier_postfixes or generate a list of postfixes
  postfixes = var.instance_count != 1 ? var.instance_identifier_postfixes != null ? var.instance_identifier_postfixes : tolist([for i in range(1, var.instance_count + 1) : tostring(i)]) : null

  # Generate instance names based on the postfixes
  oracle_instance_names = var.instance_count != 1 ? tolist([
    for postfix in local.postfixes : "${var.instance_identifier}-${postfix}"
    ]) : tolist([
    var.instance_identifier
  ])
}

module "oracle-instance" {
  source = "../aws-rds-instance"

  count = var.instance_count

  allocated_storage               = var.instance_allocated_storage
  apply_immediately               = var.instance_apply_immediately
  db_name                         = var.instance_db_name
  deletion_protection             = var.instance_deletion_protection
  enabled_cloudwatch_logs_exports = var.instance_enabled_cloudwatch_logs_exports
  engine                          = "oracle-ee"
  engine_version                  = var.instance_engine_version
  final_snapshot_identifier       = var.instance_final_snapshot_identifier
  identifier                      = local.oracle_instance_names[count.index]
  instance_class                  = var.instance_instance_class
  max_allocated_storage           = var.instance_max_allocated_storage
  option_group_name               = var.instance_option_group_name
  parameter_group_name            = module.oracle-parameter-group.this.id
  password                        = var.instance_password
  port                            = var.instance_port
  publicly_accessible             = var.instance_publicly_accessible
  skip_final_snapshot             = var.instance_skip_final_snapshot
  subnet_group_name               = var.instance_subnet_group_name
  tags                            = var.instance_tags
  username                        = var.instance_username
  vpc_security_group_ids          = var.instance_vpc_security_group_ids
}

module "oracle-log-group" {
  source = "../aws-cloudwatch-log-group"

  count = var.instance_count

  name              = "/aws/rds/instance/${local.oracle_instance_names[count.index]}/audit"
  retention_in_days = var.log_group_retention_in_days
}

data "aws_iam_policy_document" "log_group_to_firehose" {
  statement {
    effect = "Allow"

    actions   = ["firehose:PutRecord", "firehose:PutRecordBatch"]
    resources = [module.kinesis-firehose-delivery-stream.this.arn]
  }
}

data "aws_iam_policy_document" "cloudwatch_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["logs.amazonaws.com", "logs.${data.aws_region.current.name}.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

module "log-group-firehose-iam-role" {
  source = "../aws-iam-role"

  assume_role_policy = data.aws_iam_policy_document.cloudwatch_assume_role.json
  description        = var.log_group_to_firehose_iam_role_description
  name               = var.log_group_to_firehose_iam_role_name
  name_prefix        = var.log_group_to_firehose_iam_role_name_prefix
  tags               = var.log_group_to_firehose_iam_role_tags
}

module "log-group-firehose-iam-role-policy" {
  source = "../aws-iam-role-policy"

  name   = "log_group_to_firehose_policy"
  role   = module.log-group-firehose-iam-role.this.name
  policy = data.aws_iam_policy_document.log_group_to_firehose.json
}

module "oracle-log-group-subscription-filter" {
  depends_on = [module.kinesis-firehose-delivery-stream]
  source     = "../aws-cloudwatch-log-subscription-filter"

  count = var.instance_count

  destination_arn = module.kinesis-firehose-delivery-stream.this.arn
  filter_pattern  = ""
  log_group_name  = module.oracle-log-group[count.index].this.name
  name            = replace(module.oracle-instance[count.index].this.arn, ":", "_")
  role_arn        = module.log-group-firehose-iam-role.this.arn
}

data "aws_iam_policy_document" "firehose_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "firehose_to_s3" {
  statement {
    sid    = "AWSFirehoseWriteToS3"
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:*",
    ]
    resources = ["*"]
  }
  statement {
    sid    = "AWSFirehoseAccessToKinesis"
    effect = "Allow"

    actions = [
      "kinesis:*",
      "kinesisanalytics:*",
    ]
    resources = ["*"]
  }
  statement {
    sid    = "AWSFirehoseAccessToKMS"
    effect = "Allow"

    actions   = ["kms:*"]
    resources = ["*"]
  }
  statement {
    sid    = "AWSFirehoseAccessToCloudWatch"
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "logs:DescribeLogStreams"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "firehose_to_log_group" {
  statement {
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogStream",
      "logs:DescribeLogStreams"
    ]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/kinesisfirehose", "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/kinesisfirehose/*"]
  }
}

module "firehose-s3-iam-role" {
  source = "../aws-iam-role"

  assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
  description        = var.firehose_iam_role_description
  name               = var.firehose_to_s3_iam_role_name
  name_prefix        = var.firehose_to_s3_iam_role_name_prefix
  tags               = var.firehose_iam_role_tags
}

module "firehose-s3-iam-role-policy" {
  source = "../aws-iam-role-policy"

  name   = "firehose_to_s3_policy"
  role   = module.firehose-s3-iam-role.this.name
  policy = data.aws_iam_policy_document.firehose_to_s3.json
}

module "firehose-log-group-iam-role-policy" {
  source = "../aws-iam-role-policy"

  name   = "firehose_to_log_group_policy"
  role   = module.firehose-s3-iam-role.this.name
  policy = data.aws_iam_policy_document.firehose_to_log_group.json
}

module "kinesis-firehose-delivery-stream" {
  depends_on = [module.s3-bucket]
  source     = "../aws-kinesis-firehose-delivery-stream"

  destination = "extended_s3"
  name        = var.firehose_name
  tags        = var.firehose_tags
  extended_s3_configuration = {
    role_arn            = module.firehose-s3-iam-role.this.arn
    bucket_arn          = module.s3-bucket.this.arn
    buffering_interval  = var.firehose_buffering_interval
    buffering_size      = var.firehose_buffering_size
    file_extension      = ".json.gz"
    compression_format  = "GZIP"
    prefix              = "AWSLogs/${data.aws_caller_identity.current.account_id}/OracleRDS/${data.aws_region.current.name}/!{timestamp:yyyy/MM/dd/HH/mm/}"
    error_output_prefix = "errors/result=!{firehose:error-output-type}/!{timestamp:yyyy/MM/dd/HH/mm/}"
    processing_configuration = {
      enabled = "true"
      processors = [
        {
          type = "Decompression"
        },
        {
          type = "AppendDelimiterToRecord"
        }
      ]
    }
    cloudwatch_logging_options = {
      enabled         = var.firehose_cloudwatch_logging_enabled
      log_group_name  = var.firehose_cloudwatch_logging_log_group_name
      log_stream_name = var.firehose_cloudwatch_logging_log_stream_name
    }
  }
}

data "aws_iam_policy_document" "firehose_to_s3_policy" {
  statement {
    sid    = "AWSFirehoseWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]

    resources = ["${module.s3-bucket.this.arn}", "${module.s3-bucket.this.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:${data.aws_partition.current.partition}:firehose:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:deliverystream/${module.kinesis-firehose-delivery-stream.this.name}"]
    }
  }
}

module "s3-bucket-policy" {
  source = "../aws-s3-bucket-policy"

  bucket = module.s3-bucket.this.id
  policy = data.aws_iam_policy_document.firehose_to_s3_policy.json
}

module "s3-bucket" {
  source = "../aws-s3-bucket"

  bucket        = var.s3_bucket
  force_destroy = var.s3_force_destroy
  tags          = var.s3_tags
}

module "aws-rds-oracle-asset" {
  source = "../dsfhub-aws-rds-oracle"

  count = var.instance_count

  admin_email               = var.aws_rds_oracle_admin_email
  asset_display_name        = module.oracle-instance[count.index].this.identifier
  asset_id                  = module.oracle-instance[count.index].this.arn
  audit_pull_enabled        = var.aws_rds_oracle_audit_pull_enabled
  gateway_id                = var.aws_rds_oracle_gateway_id
  logs_destination_asset_id = module.aws-s3-asset.this.asset_id
  parent_asset_id           = var.aws_rds_oracle_parent_asset_id
  region                    = data.aws_region.current.name
  server_host_name          = module.oracle-instance[count.index].this.address
  server_port               = module.oracle-instance[count.index].this.port
  service_name              = module.oracle-instance[count.index].this.db_name
}

module "aws-s3-asset" {
  depends_on = [module.s3-bucket]
  source     = "../dsfhub-aws-s3-bucket-la"

  admin_email                  = var.aws_s3_admin_email
  arn                          = module.s3-bucket.this.arn
  asset_display_name           = module.s3-bucket.this.id
  asset_id                     = module.s3-bucket.this.arn
  audit_pull_enabled           = var.aws_s3_audit_pull_enabled
  audit_type                   = "ORACLE"
  available_bucket_account_ids = var.aws_s3_available_bucket_account_ids
  available_regions            = var.aws_s3_available_regions
  bucket_account_id            = data.aws_caller_identity.current.account_id
  gateway_id                   = var.aws_s3_gateway_id
  parent_asset_id              = var.aws_s3_parent_asset_id
  region                       = data.aws_region.current.name
  server_host_name             = module.s3-bucket.this.id
  server_port                  = "443"
}
