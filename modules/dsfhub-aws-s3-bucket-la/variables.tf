variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "arn" {
  description = "The ARN of the S3 bucket, e.g. \"arn:aws:s3:::bucket-name\""
  type        = string
  default     = null
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by the user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:s3:::bucket-name\""
  type        = string
}

variable "audit_pull_enabled" {
  description = "Whether the DSFHUB should pull logs from the asset."
  type        = bool
  default     = false
}

variable "audit_type" {
  description = "Used to indicate what type of audit will be pulled on systems supporting multiple audit types. Default is null. Valid values: LOG_GROUP, KINESIS, CLOUDWATCH, REDSHIFT, DYNAMODB, ORACLE"
  type        = string
  default     = null
  validation {
    condition     = (var.audit_type == null ? true : (can(regex("LOG_GROUP|KINESIS|CLOUDWATCH|REDSHIFT|DYNAMODB|ORACLE", var.audit_type))))
    error_message = "audit_type must be one of LOG_GROUP, KINESIS, CLOUDWATCH, REDSHIFT, DYNAMODB, ORACLE or null."
  }
}

variable "available_bucket_account_ids" {
  description = "A list of AWS Account IDs to use when pulling account specific audit logs from this bucket. eg: ['123456789012', ‘123456789013’]."
  type        = list(string)
  default     = []
}

variable "available_regions" {
  description = "A list of regions to use when pulling region-specific audit logs from this bucket."
  type        = list(string)
  default     = []
}

variable "bucket_account_id" {
  description = "Mandatory for audit types: REDSHIFT and DYNAMODB. Account number found in the prefix of the files we are pulling. e.g: `123456789012` out of `redshift/AWSLogs/123456789012/redshift/us-east-1/2024/06/25/my_file.gz`"
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id of AWS cloud account being used. E.g. Key-pair, iam_role, profile or default"
  type        = string
}

variable "region" {
  description = "AWS region containing the instance."
  type        = string
}

variable "server_host_name" {
  description = "S3 bucket name."
  type        = string
}

variable "server_ip" {
  description = "S3 bucket ARN."
  type        = string
}

variable "server_port" {
  description = "Database port being used."
  type        = number
  default     = 443
}

variable "s3_provider" {
  description = "Required only for AWS RDS MS SQL SERVER. Accepted value: 'aws-rds-mssql'"
  type        = string
  default     = null
}
