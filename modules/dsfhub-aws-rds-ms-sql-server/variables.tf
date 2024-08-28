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

variable "database_name" {
  description = "Specifies the name of the database you are connected to (or default DB)."
  type        = string
  default     = null
}

variable "db_engine_version" {
  description = "Denotes the major version of the DB engine of the asset, e.g. 2015 vs. 2019"
  type        = string
  default     = null
}

variable "db_instance_count" {
  description = "Number of database instances."
  type        = number
  default     = 1
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "logs_destination_asset_id" {
  description = "asset_id of the S3 bucket asset where the logs for this database can be found."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
  default     = null
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
  default     = null
}
