# Collect AWS region & account info
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

# Generates an IAM policy document in JSON format for use with resources 
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

module "s3-bucket" {
  source = "../aws-s3-bucket"

  bucket        = var.s3_bucket_name
  force_destroy = var.s3_bucket_force_destroy
  tags          = var.s3_bucket_tags
}

# Attaches a policy to an S3 bucket resource
module "s3-bucket-policy" {
  source = "../aws-s3-bucket-policy"

  bucket = module.s3-bucket.this.id
  policy = data.aws_iam_policy_document.cloudtrail_to_s3_policy.json
}

module "cloudtrail" {
  depends_on = [module.s3-bucket-policy]
  source     = "../aws-cloudtrail"

  enable_logging                = var.cloudtrail_enable_logging
  event_selector                = var.cloudtrail_event_selector
  include_global_service_events = false
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  name                          = var.cloudtrail_name
  s3_bucket_name                = module.s3-bucket.this.id
}

module "dynamodb-log-group" {
  source = "../aws-cloudwatch-log-group"

  name              = "/aws/events/${var.log_group_name}"
  retention_in_days = var.log_group_retention_in_days
}

data "aws_iam_policy_document" "eventbridge_to_cloudwatch" {
  depends_on = [module.eventbridge-rule]

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream"
    ]

    resources = [
      "${module.dynamodb-log-group.this.arn}:*"
    ]

    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "delivery.logs.amazonaws.com"
      ]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:PutLogEvents"
    ]

    resources = [
      "${module.dynamodb-log-group.this.arn}:*:*"
    ]

    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "delivery.logs.amazonaws.com"
      ]
    }

    condition {
      test     = "ArnEquals"
      values   = [module.eventbridge-rule.this.arn]
      variable = "aws:SourceArn"
    }
  }
}

module "cloudwatch-policy" {
  source = "../aws-cloudwatch-log-resource-policy"

  policy_document = data.aws_iam_policy_document.eventbridge_to_cloudwatch.json
  policy_name     = var.cloudwatch_policy_policy_name
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

  arn  = module.dynamodb-log-group.this.arn
  rule = module.eventbridge-rule.this.name
}

module "aws-dynamodb-asset" {
  source = "../dsfhub-aws-dynamodb"

  access_id          = var.aws_dynamodb_access_id
  admin_email        = var.aws_dynamodb_admin_email
  asset_display_name = "arn:${data.aws_partition.current.partition}:dynamodb:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}"
  asset_id           = "arn:${data.aws_partition.current.partition}:dynamodb:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}"
  audit_type         = "LOG_GROUP"
  auth_mechanism     = var.aws_dynamodb_auth_mechanism
  gateway_id         = var.aws_dynamodb_gateway_id
  iam_role_name      = var.aws_dynamodb_iam_role_name
  secret_key         = var.aws_dynamodb_secret_key
  username           = var.aws_dynamodb_profile_name

  region           = data.aws_region.current.name
  server_host_name = "dynamodb.${data.aws_region.current.name}.amazonaws.com"
  server_port      = "443"
}

module "aws-log-group-asset" {
  source = "../dsfhub-aws-log-group"

  admin_email        = var.aws_log_group_admin_email
  asset_display_name = "${module.dynamodb-log-group.this.arn}:*"
  asset_id           = "${module.dynamodb-log-group.this.arn}:*"
  audit_pull_enabled = var.aws_log_group_audit_pull_enabled
  gateway_id         = var.aws_log_group_gateway_id
  parent_asset_id    = module.aws-dynamodb-asset.this.asset_id
  reason             = var.aws_log_group_reason
  region             = data.aws_region.current.name
}
