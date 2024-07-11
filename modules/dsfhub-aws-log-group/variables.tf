variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS log group ARN"
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'."
  type        = string
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region of the log group"
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events). The parent must either be an AWS account, or have a parent which is an AWS account."
  type        = string
}
