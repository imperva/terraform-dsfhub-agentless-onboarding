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

variable "aws_dynamodb_secret_key" {
  description = "AWS secret key. Required for \"key\" auth_mechanism."
  type        = string
  default     = null
}

variable "aws_dynamodb_profile_name" {
  description = "The name of a profile in /install_dir/jsonar/local/credentials/.aws/credentials to use for authentication. Required for \"profile\" auth_mechanism."
  type        = string
  default     = null
}

variable "aws_log_group_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "aws_log_group_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_log_group_gateway_id" {
  description = "The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'."
  type        = string
}

variable "aws_log_group_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
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
  description = "Specifies an event selector for enabling data event logging. Note: exclude_management_event_sources requires include_management_events set to true. If include_management_events is set to false, do not pass in exclude_management_event_sources."
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

variable "cloudwatch_policy_policy_name" {
  description = "Name of the resource policy."
  type        = string
  default     = "eventbridge-to-cloudwatch-policy"
}

variable "eventbridge_rule_description" {
  description = "The description of the EventBridge rule."
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

variable "log_group_name" {
  description = "Name of AWS CloudWatch log group to contain DynamoDB logs. Will be prefixed with \"/aws/events\"."
  type        = string
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}

variable "s3_bucket_name" {
  description = "The name of the bucket. Must be lowercase and less than or equal to 63 characters in length."
  type        = string
}

variable "s3_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. See more details in the [aws terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#force_destroy)."
  type        = bool
  default     = false
}

variable "s3_bucket_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}
