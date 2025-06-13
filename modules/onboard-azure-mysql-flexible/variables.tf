variable "azure_mysql_flexible_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_mysql_flexible_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_mysql_flexible_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_mysql_flexible_location" {
  description = "Physical location/region of the MySQL instance, e.g. \"EAST US\""
  type        = string
  default     = null
}

variable "azure_mysql_flexible_logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
}

variable "azure_mysql_flexible_parent_asset_id" {
  description = "The asset_id of the AZURE asset representing the Azure account where this server is located."
  type        = string
  default     = null
}

variable "diagnostic_setting_eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. "
  type        = string
  default     = null
}

variable "diagnostic_setting_eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "diagnostic_setting_name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
  default     = "dsfhubdiagnostic"
}

variable "server_administrator_login" {
  description = "The Administrator login for the MySQLs Flexible Server."
  type        = string
}

variable "server_administrator_password" {
  description = "The Password associated with the administrator_login for the MySQL Flexible Server."
  type        = string
}

variable "server_config_slow_query_time" {
  description = "The time in seconds that a query must take to be considered slow. Defaults to 0 seconds."
  type        = number
  default     = 0
}

variable "server_config_slow_query_log" {
  description = "Enable or disable the slow query log. Defaults to false."
  type        = bool
  default     = false
}

variable "server_config_require_secure_transport" {
  description = "If true, requires secure transport for connections to the MySQL Flexible Server. Defaults to true."
  type        = bool
  default     = true
}

variable "server_location" {
  description = "The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "server_name" {
  description = "The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "server_mysql_version" {
  description = "The version of MySQL Flexible Server to use. Possible values are 5.7 or 8.0.21"
  type        = string
  validation {
    condition     = contains(["5.7", "8.0.21"], var.server_mysql_version)
    error_message = "Invalid MySQL version. Possible values are 5.7 or 8.0.21."
  }
}

variable "server_public_network_access" {
  description = "Specifies whether this MySQL Flexible Server is publicly accessible. Possible values are Enabled and Disabled"
  type        = string
  validation {
    condition     = contains(["Enabled", "Disabled"], var.server_public_network_access)
    error_message = "Invalid public network access value. Possible values are Enabled and Disabled."
  }
}

variable "server_resource_group_name" {
  description = "The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "server_sku_name" {
  description = "The SKU Name for the MySQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3). Defaults to GP_Standard_D2ds_v4"
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "server_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "server_auto_grow_enabled" {
  description = "Should Storage Auto Grow be enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "server_io_scaling_enabled" {
  description = "Should IO Scaling be enabled? If true, iops can not be set. Defaults to false"
  type        = bool
  default     = false
}

variable "server_iops" {
  description = "The storage IOPS for the MySQL Flexible Server. Possible values are between 360 and 20000. Defaults to null. If IO Scaling is enabled, the value will automatically be null."
  type        = number
  default     = null
  validation {
    condition     = var.server_iops != null ? (var.server_iops >= 360 && var.server_iops <= 20000) : true
    error_message = "Invalid IOPS value. If IO Scaling is enabled, IOPS cannot be set. Otherwise, it must be between 360 and 20000."
  }
}

variable "server_log_on_disk_enabled" {
  description = "Should Storage Log On Disk be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "server_size_gb" {
  description = "The size of the storage in GB for the MySQL Flexible Server. Possible values are between 20 and 16384. Defaults to 20."
  type        = number
  default     = 20
  validation {
    condition     = var.server_size_gb >= 20 && var.server_size_gb <= 16384
    error_message = "Invalid size_gb value. It must be between 20 and 16384."
  }
}
