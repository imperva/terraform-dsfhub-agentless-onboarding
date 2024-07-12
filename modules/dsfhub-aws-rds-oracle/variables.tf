variable "admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "AWS ARN, e.g. \"arn:aws:rds:us-east-2:123456790:db:db-name\""
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

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
}

variable "dsn" {
  description = "Datasource name to use in odbc.ini. If using the asset for SDM, keep a dummy DSN value."
  type        = string
  default     = null
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
  default     = null
}

variable "password" {
  description = "Password to use to connect to Oracle database. Must not include semicolons."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS region containing the instance."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}

variable "server_port" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}

variable "service_name" {
  description = "Oracle service name, or SID. e.g. ORCL"
  type        = string
}

variable "username" {
  description = "Username to use to connect to Oracle database."
  type        = string
  default     = null
}

variable "wallet_dir" {
  description = "Path to the Oracle wallet directory"
  type        = string
  default     = null
}
