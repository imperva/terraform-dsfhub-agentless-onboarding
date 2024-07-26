locals {
  aws_region  = "us-east-2"
  admin_email = "person@example.com"
  gateway_id  = "a1b2c3d4-1234-5678-9123-cd1edcef7642"
}

################################################################################
# Providers
################################################################################
terraform {
  required_providers {
    dsfhub = {
      source = "imperva/dsfhub"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

variable "dsfhub_host" {}  # TF_VAR_dsfhub_host env variable
variable "dsfhub_token" {} # TF_VAR_dsfhub_token env variable

provider "dsfhub" {
  dsfhub_host  = var.dsfhub_host
  dsfhub_token = var.dsfhub_token
}

################################################################################
# AWS DynamoDB - default auth_mechanism
################################################################################
module "dynamodb-1" {
  source = "../../modules/onboard-aws-dynamodb-cloudwatch"

  aws_dynamodb_admin_email    = local.admin_email
  aws_dynamodb_auth_mechanism = "default"
  aws_dynamodb_gateway_id     = local.gateway_id

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_reason             = "default"

  cloudtrail_name = "tf-dynamodb-cloudtrail"

  eventbridge_rule_name = "tf-dynamodb-eventbridge-rule"

  log_group_name = "tf-dynamodb-log-group"

  s3_bucket_name = "tf-dynamodb-bucket"
}

################################################################################
# AWS DynamoDB - iam_role auth_mechanism
################################################################################
module "dynamodb-2" {
  source = "../../modules/onboard-aws-dynamodb-cloudwatch"

  aws_dynamodb_admin_email    = local.admin_email
  aws_dynamodb_auth_mechanism = "iam_role"
  aws_dynamodb_gateway_id     = local.gateway_id
  aws_dynamodb_iam_role_name  = "arn:aws:iam::0123456789:role/my-example-role"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_reason             = "default"

  cloudtrail_name = "tf-dynamodb-cloudtrail"

  eventbridge_rule_name = "tf-dynamodb-eventbridge-rule"

  log_group_name = "tf-dynamodb-log-group"

  s3_bucket_name = "tf-dynamodb-bucket"
}

################################################################################
# AWS DynamoDB - key auth_mechanism
################################################################################
# Source AWS key pair from environment variables
variable "aws_dynamodb_access_id" {}  # env var: TF_VAR_aws_dynamodb_access_id
variable "aws_dynamodb_secret_key" {} # env var: TF_VAR_aws_dynamodb_secret_key

module "dynamodb-3" {
  source = "../../modules/onboard-aws-dynamodb-cloudwatch"

  aws_dynamodb_admin_email    = local.admin_email
  aws_dynamodb_auth_mechanism = "key"
  aws_dynamodb_gateway_id     = local.gateway_id
  aws_dynamodb_access_id      = var.aws_dynamodb_access_id
  aws_dynamodb_secret_key     = var.aws_dynamodb_secret_key

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_reason             = "default"

  cloudtrail_name = "tf-dynamodb-cloudtrail"

  eventbridge_rule_name = "tf-dynamodb-eventbridge-rule"

  log_group_name = "tf-dynamodb-log-group"

  s3_bucket_name = "tf-dynamodb-bucket"
}

################################################################################
# AWS DynamoDB - profile auth_mechanism
################################################################################
module "dynamodb-4" {
  source = "../../modules/onboard-aws-dynamodb-cloudwatch"

  aws_dynamodb_admin_email    = local.admin_email
  aws_dynamodb_auth_mechanism = "profile"
  aws_dynamodb_gateway_id     = local.gateway_id
  aws_dynamodb_profile_name   = "my-profile"

  aws_log_group_admin_email        = local.admin_email
  aws_log_group_audit_pull_enabled = true
  aws_log_group_gateway_id         = local.gateway_id
  aws_log_group_reason             = "default"

  cloudtrail_name = "tf-dynamodb-cloudtrail"

  eventbridge_rule_name = "tf-dynamodb-eventbridge-rule"

  log_group_name = "tf-dynamodb-log-group"

  s3_bucket_name = "tf-dynamodb-bucket"
}
