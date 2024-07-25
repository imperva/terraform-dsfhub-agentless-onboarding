variable "aws_dynamodb_access_id" {
  description = "AWS Access ID. Required for \"key\" auth_mechanism."
  type        = string
  default     = null
}

variable "aws_dynamodb_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_dynamodb_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam_role."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["key", "profile", "default", "iam_role"], var.aws_dynamodb_auth_mechanism)
    error_message = "Invalid auth mechanism. Valid values: key, profile, default or iam_role."
  }
}

variable "aws_dynamodb_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_dynamodb_iam_role_name" {
  description = "AWS arn of the IAM role to be assumed. Required for \"iam_role\" auth_mechanism."
  type        = string
  default     = null
}

variable "aws_dynamodb_profile_name" {
  description = "The name of a profile in /install_dir/jsonar/local/credentials/.aws/credentials to use for authenticating"
  type        = string
  default     = null
}

variable "aws_dynamodb_secret_key" {
  description = "AWS secret key. Required for \"key\" auth_mechanism."
  type        = string
  default     = null
}

variable "aws_s3_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_s3_audit_pull_enabled" {
  description = "Whether the DSFHUB should pull logs from the asset."
  type        = bool
  default     = false
}

variable "aws_s3_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}


variable "cloudtrail_enable_logging" {
  description = "Enables logging for the trail. Setting this to \"false\" will pause logging."
  type        = bool
  default     = true
}

variable "cloudtrail_is_multi_region_trail" {
  description = "Whether the trail is created in the current region or in all regions."
  type        = bool
  default     = false
}

variable "cloudtrail_name" {
  description = "Name of the trail."
  type        = string
}

variable "cloudtrail_event_selector" {
  description = "Specifies an event selector for enabling data event logging."
  type = list(
    object(
      {
        data_resource = optional(
          object(
            {
              type   = string
              values = list(string)
            }
          )
        )
        exclude_management_event_sources = optional(list(string))
        include_management_events        = optional(bool)
        read_write_type                  = optional(string)
      }
    )
  )
  default = [
    {
      data_resource = {
        type   = "AWS::DynamoDB::Table"
        values = ["arn:aws:dynamodb"]
      }
      exclude_management_event_sources = [
        "kms.amazonaws.com",
        "rdsdata.amazonaws.com"
      ]
      include_management_events = true
      read_write_type           = "All"
    }
  ]
}

variable "eventbridge_rule_description" {
  description = "The description of the rule."
  type        = string
  default     = "Captures All DynamoDB events and sends to CloudWatch log group"
}

variable "eventbridge_rule_name" {
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "eventbridge_rule_event_pattern" {
  description = "The event pattern described a JSON object. See full documentation of [Events and Event Patterns in EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html) for details."
  type        = any
  default = {
    "source" : ["aws.dynamodb"],
    "detail" : {
      "eventSource" : ["dynamodb.amazonaws.com"],
      "eventCategory" : ["Management"],
      "sourceIPAddress" : [{
        "anything-but" : ["replication.dynamodb.amazonaws.com", "dynamodb.application-autoscaling.amazonaws.com", "application-autoscaling.amazonaws.com"]
      }]
    }
  }
}

variable "eventbridge_rule_state" {
  description = "State of the rule. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS."
  type        = string
  default     = "ENABLED"
  validation {
    condition     = contains(["DISABLED", "ENABLED", "ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS"], var.eventbridge_rule_state)
    error_message = "Invalid state. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS."
  }
}

variable "eventbridge_rule_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "eventbridge_iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource."
  type        = string
  default     = "dynamodb_eventbridge_role"
}

variable "eventbridge_iam_role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources."
  type        = string
  default     = null
}

variable "eventbridge_iam_role_description" {
  description = "The description of the IAM role."
  type        = string
  default     = "IAM role for sending DynamoDB logs from EventBridge to Firehose."
}

variable "eventbridge_iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = null
}

variable "firehose_iam_role_description" {
  description = "The description of the IAM role."
  type        = string
  default     = "IAM role for sending DynamoDB logs from Firehose to S3."
}

variable "firehose_iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource."
  type        = string
  default     = "dynamodb_firehose_role"
}

variable "firehose_iam_role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources."
  type        = string
  default     = null
}

variable "firehose_iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = null
}

variable "firehose_name" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
  type        = string
}

variable "firehose_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "s3_bucket" {
  description = "The name of the bucket. Must be lowercase and less than or equal to 63 characters in length."
  type        = string
}

variable "s3_bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length."
  type        = string
  default     = null
}

variable "s3_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy)."
  type        = bool
  default     = false
}

variable "s3_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}


