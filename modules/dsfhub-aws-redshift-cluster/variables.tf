# Asset variables
variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:rds:us-east-2:123456790:cluster:cluster-name\""
  type        = string
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details. Valid values: TABLE | REDSHIFT."
  type        = string
  default     = null
}

variable "audit_pull_enabled" {
  description = "Whether the DSFHUB should pull logs from the asset."
  type        = bool
  default     = false
}

variable "bucket_account_id" {
  description = "The account_id of the bucket owner"
  type        = string
  default     = null
}

variable "database_name" {
  description = "The database name."
  type        = string
  default     = "dev"
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "logs_destination_asset_id" {
  description = "The asset_id of the AWS S3 bucket asset when the audit_type is set to REDSHIFT."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "The asset_id of AWS cloud account being used. E.g. Key-pair, iam_role, profile or default"
  type        = string
}

variable "region" {
  description = "AWS region containing the Redshift cluster."
  type        = string
}

variable "server_host_name" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}

variable "server_ip" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}

variable "server_port" {
  description = "Database port being used. Default: 5439"
  type        = number
  default     = 5439
}

variable "service_name" {
  description = "The database name (see Service Name Guidelines)."
  type        = string
  default     = null
}

# Connection variables
variable "auth_mechanism" {
  description = "The authentication mechanism to use for the Redshift asset."
  type        = string
  default     = null
}

variable "username" {
  description = "The username to use for authentication."
  type        = string
  default     = null
}

variable "password" {
  description = "The password to use for authentication."
  type        = string
  default     = null
}

variable "access_id" {
  description = "The cluster identifier."
  type        = string
  default     = null
}

variable "aws_connection_id" {
  description = "The stringified object ID of the AWS connection document."
  type        = string
  default     = null
}

variable "tmp_user" {
  description = "Whether the DSFHUB should create a temp user."
  type        = bool
  default     = null
}

variable "ssl" {
  description = "Whether to use SSL for the connection."
  type        = bool
  default     = null
}
