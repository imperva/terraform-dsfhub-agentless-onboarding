variable "azure_postgresql_flexible_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_postgresql_flexible_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_postgresql_flexible_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_postgresql_flexible_location" {
  description = "Physical location/region of the PostgreSQL instance, e.g. \"EAST US\""
  type        = string
  default     = null
}

variable "azure_postgresql_flexible_logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
}

variable "azure_postgresql_flexible_parent_asset_id" {
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
  description = "The Administrator login for the PostgreSQL Flexible Server."
  type        = string
}

variable "server_administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Flexible Server."
  type        = string
}

variable "server_configurations" {
  description = "List of objects containing the name and value of server configurations, e.g. [ { name = \"pgaudit.log\", value = \"all\" } ]"
  type = list(
    object(
      {
        name  = string
        value = string
      }
    )
  )
  default = [
    {
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name  = "log_line_prefix"
      value = "SONAR_AUDIT=1|TIMESTAMP=%m|APPLICATION_NAME=%a|USER=%u|DATABASE=%d|REMOTE_HOST_AND_PORT=%r|SQL_STATE=%e|SESSION_ID=%c|SESSION_START=%s|PROCESS_ID[%p]|VIRTUAL_TRANSACTION_ID=%v|TRANSACTION_ID=%x|"
    },
    {
      name  = "azure.extensions"
      value = "pgaudit"
    },
    {
      name  = "shared_preload_libraries"
      value = "pgaudit"
    },
  ]

}

variable "server_location" {
  description = "The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "server_name" {
  description = "The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "server_postgres_version" {
  description = "The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13, 14, 15 and 16. Defaults to 16."
  type        = number
  default     = 16
  validation {
    condition     = contains([11, 12, 13, 14, 15, 16], var.server_postgres_version)
    error_message = "Invalid PostgreSQL version. Possible values are 11, 12, 13, 14, 15 and 16."
  }
}

variable "server_public_network_access_enabled" {
  description = "Specifies whether this PostgreSQL Flexible Server is publicly accessible. Defaults to true."
  type        = bool
  default     = true
}

variable "server_resource_group_name" {
  description = "The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "server_sku_name" {
  description = "The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3).  Defaults to GP_Standard_D2s_v3."
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "server_storage_mb" {
  description = "The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408. Defaults to 32768."
  type        = number
  default     = "32768"
  validation {
    condition = contains(
      [
        32768,
        65536,
        131072,
        262144,
        524288,
        1048576,
        2097152,
        4193280,
        4194304,
        8388608,
        16777216,
        33553408
      ],
    var.server_storage_mb)
    error_message = "Invalid value for storage_mb. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408"
  }
}

variable "server_storage_tier" {
  description = "The name of storage performance tier for IOPS of the PostgreSQL Flexible Server. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80. Default value is dependant on the storage_mb value. Please see the storage_tier defaults based on storage_mb table [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#storage_tier-defaults-based-on-storage_mb)."
  type        = string
  default     = null
  validation {
    condition = (
      var.server_storage_tier == null ||
      can(
        contains(
          [
            "P4",
            "P6",
            "P10",
            "P15",
            "P20",
            "P30",
            "P40",
            "P50",
            "P60",
            "P70",
            "P80",
          ],
          var.server_storage_tier
        )
      )
    )
    error_message = "Invalid value for storage_tier. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80."
  }
}

variable "server_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
