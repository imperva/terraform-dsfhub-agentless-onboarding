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

variable "audit_type" {
  description = "Determines what mapping/gateway service will handle the asset."
  type        = string
  default     = "LOG_GROUP"
  validation {
    condition     = contains(["LOG_GROUP", "AGGREGATED", "TABLE"], var.audit_type)
    error_message = "Invalid Value. Select from LOG_GROUP, AGGREGATED, or TABLE."
  }
}

variable "database_name" {
  description = "Specifies the name of the database you are connected to (or default DB)."
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
}

variable "region" {
  description = "AWS region containing the instance."
  type        = string
}

variable "server_host_name" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}

variable "server_port" {
  description = "Endpoint URL, e.g. <domain>.amazon.com"
  type        = string
}
