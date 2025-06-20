variable "audit_policy_enabled" {
  description = "Whether to enable the extended auditing policy on the SQL Server instance. Defaults to true."
  type        = bool
  default     = true
}

variable "azure_ms_sql_server_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_ms_sql_server_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_ms_sql_server_database_name" {
  description = "Specifies the name of the database to connect to (or default DB)."
  type        = string
  default     = "master"
}

variable "azure_ms_sql_server_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_ms_sql_server_location" {
  description = "Physical location/region of the SQL Server instance, e.g. \"EAST US\""
  type        = string
  default     = null
}

variable "azure_ms_sql_server_logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
}

variable "azure_ms_sql_server_parent_asset_id" {
  description = "The asset_id of the AZURE asset representing the Azure account where this server is located."
  type        = string
  default     = null
}

variable "diagnostic_setting_eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. Must have write access."
  type        = string
}

variable "diagnostic_setting_eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
}

variable "diagnostic_setting_name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
  default     = "dsfhubdiagnostic"
}

variable "firewall_rules" {
  description = "A list of firewall rules to apply to the SQL Server. Each rule should have a name, start_ip, and end_ip."
  type = list(object({
    name     = string
    start_ip = string
    end_ip   = string
  }))
  default = []
}

variable "server_administrator_login" {
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}

variable "server_administrator_login_password" {
  description = "The password associated with the administrator_login user."
  type        = string
}

variable "server_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "server_name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "server_public_network_access_enabled" {
  description = "Whether public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = true
}

variable "server_resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created."
  type        = string
}

variable "server_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created."
  type        = string
  default     = "12.0"
  validation {
    condition     = contains(["2.0", "12.0"], var.server_version)
    error_message = "Invalid version. Valid options 2.0 (for v11 server) and 12.0 (for v12 server)."
  }
}
