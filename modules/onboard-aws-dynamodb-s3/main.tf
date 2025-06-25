# Collect AWS region & account info
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

module "s3-bucket" {
  source = "../aws-s3-bucket"

  bucket        = var.s3_bucket
  force_destroy = var.s3_force_destroy
  tags          = var.s3_tags
}

data "aws_iam_policy_document" "cloudtrail_to_s3_policy" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [module.s3-bucket.this.arn]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:${data.aws_partition.current.partition}:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/${var.cloudtrail_name}"]
    }
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:PutObject"]
    resources = ["${module.s3-bucket.this.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = ["arn:${data.aws_partition.current.partition}:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/${var.cloudtrail_name}"]
    }
  }
}

module "s3-bucket-policy" {
  source = "../aws-s3-bucket-policy"

  bucket = module.s3-bucket.this.id
  policy = data.aws_iam_policy_document.cloudtrail_to_s3_policy.json
}

module "dynamodb-cloudtrail" {
  depends_on = [module.s3-bucket-policy]
  source     = "../aws-cloudtrail"

  enable_logging                = var.cloudtrail_enable_logging
  event_selector                = var.cloudtrail_event_selector
  include_global_service_events = false
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  name                          = var.cloudtrail_name
  s3_bucket_name                = module.s3-bucket.this.id
}

data "aws_iam_policy_document" "eventbridge_to_firehose" {
  statement {
    effect = "Allow"

    actions = ["firehose:PutRecord",
    "firehose:PutRecordBatch"]
    resources = [module.kinesis-firehose-delivery-stream.this.arn]
  }
}

data "aws_iam_policy_document" "firehose_to_s3" {
  statement {
    effect = "Allow"

    actions = ["s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
    "s3:PutObject"]
    resources = [module.s3-bucket.this.arn, "${module.s3-bucket.this.arn}/*"]
  }
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

data "aws_iam_policy_document" "eventbridge_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

module "eventbridge-firehose-iam-role" {
  source = "../aws-iam-role"

  assume_role_policy = data.aws_iam_policy_document.eventbridge_assume_role.json
  description        = var.eventbridge_iam_role_description
  # inline_policy = [
  #   {
  #     name   = "eventbridge_to_firehose_policy"
  #     policy = data.aws_iam_policy_document.eventbridge_to_firehose.json
  #   }
  # ]
  name        = var.eventbridge_iam_role_name
  name_prefix = var.eventbridge_iam_role_name_prefix
  tags        = var.eventbridge_iam_role_tags
}

module "eventbridge-firehose-iam-role-policy" {
  source = "../aws-iam-role-policy"

  name   = "eventbridge_to_firehose_policy"
  policy = data.aws_iam_policy_document.eventbridge_to_firehose.json
  role   = module.eventbridge-firehose-iam-role.this.name
}

module "firehose-s3-iam-role" {
  source = "../aws-iam-role"

  assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
  description        = var.firehose_iam_role_description
  # inline_policy = [
  #   {
  #     name   = "firehose_to_s3_policy"
  #     policy = data.aws_iam_policy_document.firehose_to_s3.json
  #   }
  # ]
  name        = var.firehose_iam_role_name
  name_prefix = var.firehose_iam_role_name_prefix
  tags        = var.firehose_iam_role_tags
}

module "firehose-s3-iam-role-policy" {
  source = "../aws-iam-role-policy"

  name   = "firehose_to_s3_policy"
  policy = data.aws_iam_policy_document.firehose_to_s3.json
  role   = module.firehose-s3-iam-role.this.name
}

module "kinesis-firehose-delivery-stream" {
  depends_on = [module.s3-bucket]
  source     = "../aws-kinesis-firehose-delivery-stream"

  destination = "extended_s3"
  extended_s3_configuration = {
    role_arn            = module.firehose-s3-iam-role.this.arn
    bucket_arn          = module.s3-bucket.this.arn
    file_extension      = ".json.gz"
    prefix              = "AWSLogs/${data.aws_caller_identity.current.account_id}/CloudTrail/${data.aws_region.current.name}/!{timestamp:yyyy/MM/dd/}"
    compression_format  = "GZIP"
    error_output_prefix = "FirehosetoS3Error/!{firehose:error-output-type}/!{timestamp:yyyy/MM/dd/}"
    processing_configuration = {
      enabled = "true"
      processors = {
        type = "AppendDelimiterToRecord"
      }
    }
  }
  name = var.firehose_name
  tags = var.firehose_tags
}

module "eventbridge-rule" {
  source = "../aws-cloudwatch-event-rule"

  description   = var.eventbridge_rule_description
  event_pattern = jsonencode(var.eventbridge_rule_event_pattern)
  name          = var.eventbridge_rule_name
  state         = var.eventbridge_rule_state
  tags          = var.eventbridge_rule_tags
}

module "eventbridge-target" {
  source = "../aws-cloudwatch-event-target"

  arn      = module.kinesis-firehose-delivery-stream.this.arn
  role_arn = module.eventbridge-firehose-iam-role.this.arn
  rule     = module.eventbridge-rule.this.name
}

module "aws-dynamodb-asset" {
  source = "../dsfhub-aws-dynamodb"

  access_id          = var.aws_dynamodb_access_id
  admin_email        = var.aws_dynamodb_admin_email
  asset_display_name = "arn:${data.aws_partition.current.partition}:dynamodb:${data.aws_caller_identity.current.account_id}"
  asset_id           = "arn:${data.aws_partition.current.partition}:dynamodb:${data.aws_caller_identity.current.account_id}"
  auth_mechanism     = var.aws_dynamodb_auth_mechanism
  gateway_id         = var.aws_dynamodb_gateway_id
  iam_role_name      = var.aws_dynamodb_iam_role_name
  secret_key         = var.aws_dynamodb_secret_key
  username           = var.aws_dynamodb_profile_name

  region           = data.aws_region.current.name
  server_host_name = "dynamodb.${data.aws_region.current.name}.amazonaws.com"
  server_port      = "443"
}

module "aws-s3-asset" {
  source = "../dsfhub-aws-s3-bucket-la"

  admin_email        = var.aws_s3_admin_email
  arn                = module.s3-bucket.this.arn
  asset_display_name = module.s3-bucket.this.id
  asset_id           = module.s3-bucket.this.arn
  audit_pull_enabled = var.aws_s3_audit_pull_enabled
  audit_type         = "DYNAMODB"
  bucket_account_id  = data.aws_caller_identity.current.account_id
  gateway_id         = var.aws_s3_gateway_id
  parent_asset_id    = module.aws-dynamodb-asset.this.asset_id
  region             = data.aws_region.current.name
  server_host_name   = module.s3-bucket.this.id
  server_ip          = module.s3-bucket.this.arn
  server_port        = "443"
}
