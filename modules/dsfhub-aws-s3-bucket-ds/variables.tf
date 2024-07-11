variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by the user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:s3:::bucket-name\""
  type        = string
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
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

variable "server_port" {
  description = "Database port being used."
  type        = number
  default     = 443
}


