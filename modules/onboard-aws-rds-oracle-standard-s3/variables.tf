variable "aws_rds_oracle_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_rds_oracle_audit_pull_enabled" {
  description = "Whether the DSFHUB should pull logs from the asset."
  type        = bool
  default     = false
}

variable "aws_rds_oracle_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_rds_oracle_parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
}

variable "aws_rds_oracle_region" {
  description = "AWS region containing the instance."
  type        = string
  default     = null
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}

variable "parameter_group_description" {
  description = "The description of the DB parameter group."
  type        = string
  default     = null
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc."
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group."
  type        = string
  default     = null
}

variable "parameter_group_parameters" {
  description = "List of objects containing parameters for the DB parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [
    {
      name         = "audit_trail"
      value        = "OS"
      apply_method = "pending-reboot"
    }
  ]
}

variable "parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "instance_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  type        = number
  default     = 20
}

variable "instance_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "instance_count" {
  description = "The number of RDS Oracle instances to create. Defaults to 1."
  type        = number
  default     = 1
}

variable "instance_db_name" {
  description = "The Oracle System ID (SID) of the created RDS Custom DB instance. The default is ORCL."
  type        = string
  default     = "ORCL"
}

variable "instance_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
}

variable "instance_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "instance_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = ["audit"]
}

variable "instance_engine_version" {
  description = "Database engine version, e.g. \"8.0\""
  type        = string
  default     = null
}

variable "instance_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "instance_identifier" {
  description = "Identifier of RDS instance"
  type        = string
}

variable "instance_identifier_postfixes" {
  description = "Postfixes for the Oracle instance identifier in a many-to-one monitoring environment. If not set, numbers will be appended to the identifier."
  type        = list(string)
  default     = null
  validation {
    condition     = var.instance_identifier_postfixes == null ? true : length(var.instance_identifier_postfixes) == length(toset(var.instance_identifier_postfixes))
    error_message = "If set, all postfixes must be unique."
  }
}

variable "instance_instance_class" {
  description = "The instance type of the RDS instance. The default is db.t3.small."
  type        = string
  default     = "db.t3.small"
}

variable "instance_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage."
  type        = number
  default     = null
}

variable "instance_option_group_name" {
  description = "Name of the option group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "instance_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "instance_port" {
  description = "The port on which the DB accepts connections."
  type        = string
  default     = null
}

variable "instance_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible. Default is true."
  type        = bool
  default     = true
}

variable "instance_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is true."
  type        = bool
  default     = true
}

variable "instance_tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = null
}

variable "instance_username" {
  description = "Username for the master DB user. Defaults to \"admin\"."
  type        = string
  default     = "admin"
}

variable "instance_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
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

variable "aws_s3_available_bucket_account_ids" {
  description = "Mandatory for audit types: REDSHIFT, DYNAMODB and ORACLE. Account numbers found in the prefix of the files we are pulling. e.g: `123456789012` out of `redshift/AWSLogs/123456789012/redshift/us-east-1/2024/06/25/my_file.gz`"
  type        = list(string)
  default     = null
}

variable "aws_s3_available_regions" {
  description = "A list of regions to use when pulling region specific audit logs from this bucket."
  type        = list(string)
  default     = null
}

variable "aws_s3_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_s3_parent_asset_id" {
  description = "The asset_id of AWS cloud account being used. E.g. Key-pair, iam_role, profile or default"
  type        = string
}

variable "firehose_buffering_size" {
  description = "Buffer incoming data to the specified size, in MiB, before delivering it to the destination. The default value is 10."
  type        = number
  default     = 10
}

variable "firehose_buffering_interval" {
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300."
  type        = number
  default     = 300
}

variable "firehose_iam_role_description" {
  description = "The description of the IAM role."
  type        = string
  default     = "IAM role for sending RDS Oracle logs from Firehose to S3."
}

variable "firehose_to_s3_iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource."
  type        = string
  default     = "oracle_firehose_role"
}

variable "firehose_to_s3_iam_role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources."
  type        = string
  default     = null
}

variable "firehose_iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = null
}

variable "firehose_to_s3_iam_role_policy_name" {
  description = "The name of the IAM role policy that allows Firehose to send logs to S3."
  type        = string
  default     = "firehose_to_s3_policy"
}

variable "log_group_to_firehose_iam_role_description" {
  description = "The description of the IAM role."
  type        = string
  default     = "IAM role for sending RDS Oracle logs from Firehose to S3."
}

variable "log_group_to_firehose_iam_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. Forces new resource."
  type        = string
  default     = "log_group_to_firehose_iam_role"
}

variable "log_group_to_firehose_iam_role_name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with 'name'. Forces new resources."
  type        = string
  default     = null
}

variable "log_group_to_firehose_iam_role_tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = null
}

variable "log_group_to_firehose_iam_role_policy_name" {
  description = "The name of the IAM role policy that allows the log group to send logs to Firehose."
  type        = string
  default     = "log_group_to_firehose_policy"
}

variable "firehose_cloudwatch_logging_enabled" {
  description = "Whether to enable CloudWatch logging for the Firehose delivery stream. Defaults to false."
  type        = bool
  default     = false
}

variable "firehose_cloudwatch_logging_log_group_name" {
  description = "The name of the CloudWatch log group to which Firehose will send logs. This value is required if enabled is true."
  type        = string
  default     = null
}

variable "firehose_cloudwatch_logging_log_stream_name" {
  description = "The name of the CloudWatch log stream to which Firehose will send logs. This value is required if enabled is true."
  type        = string
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

variable "subscription_filter_name" {
  description = "A name for the subscription filter."
  type        = string
  default     = "oracle_log_group_subscription_filter"
}
