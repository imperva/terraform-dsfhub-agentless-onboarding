variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "The Azure resource ID of the SQL Managed instance."
  type        = string
}

variable "audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      var.auth_mechanism == null ||
      can(contains(["password"], var.auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password"
  }
}

variable "database_name" {
  description = "Specifies the name of the database to connect to (or default DB)."
  type        = string
  default     = "master"
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "location" {
  description = "Physical location/region of the SQL Managed instance, e.g. \"EAST US\""
  type        = string
  default     = null
}

variable "logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
  default     = null
}

variable "password" {
  description = "Password to use to connect to the SQL Managed instance."
  type        = string
  default     = null
}

variable "parent_asset_id" {
  description = "The asset_id of the AZURE asset representing the Azure account where this server is located."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "server_host_name" {
  description = "Hostname of the SQL Managed instance."
  type        = string
}

variable "server_ip" {
  description = "IP address / hostname of the SQL Managed instance."
  type        = string
}

variable "username" {
  description = "Username of SQL database user to connect with."
  type        = string
  default     = null
}
