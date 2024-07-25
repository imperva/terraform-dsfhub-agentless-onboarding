variable "access_id" {
  description = "AWS Access ID. Required for \"key\" auth_mechanism."
  type        = string
  default     = null
}

variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:dynamodb:123456789012\""
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = null
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = null
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection for the db asset. Valid values: key, profile, default or iam_role."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["key", "profile", "default", "iam_role"], var.auth_mechanism)
    error_message = "Invalid auth mechanism. Valid values: key, profile, default or iam_role."
  }
}

variable "available_regions" {
  description = "A list of regions to use when pulling region-specific audit logs"
  type        = list(string)
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "iam_role_name" {
  description = "AWS arn of the IAM role to be assumed. Required for \"iam_role\" auth_mechanism."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "DSFHUB Cloud Account Asset ID"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS region of the DynamoDB instance."
  type        = string
  default     = null
}

variable "secret_key" {
  description = "AWS secret key. Required for \"key\" auth_mechanism."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "AWS DynamoDB service endpoint"
  type        = string
  default     = "dynamodb.us-east-2.amazonaws.com"
}

variable "server_port" {
  description = "AWS DynamoDB service endpoint port"
  type        = string
  default     = "443"
}

variable "username" {
  description = "The name of a profile in /install_dir/jsonar/local/credentials/.aws/credentials to use for authenticating"
  type        = string
  default     = null
}
