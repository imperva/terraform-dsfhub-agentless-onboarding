variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "Unique identifier for the SQL Server instance in the form '{project-id}:{instance-region}:{instance-name}'."
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
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "logs_destination_asset_id" {
  description = "The asset_id of the GCP CLOUD STORAGE BUCKET asset that this asset is sending its audit logs to."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "The asset_id of the GCP asset representing the GCP account where this data source is located."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "SQL Server endpoint."
  type        = string
}

variable "server_ip" {
  description = "SQL Server IP address."
  type        = string
}
