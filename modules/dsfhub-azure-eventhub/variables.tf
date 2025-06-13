variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "asset_id" {
  description = "The Azure resource ID of the eventhub."
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
}

variable "azure_storage_account" {
  description = "Name of the Azure Storage Account that will be used to store a marker for the Event Hub pulls."
  type        = string
  default     = null
}

variable "azure_storage_container" {
  description = "Name of the Azure Storage Container that will be used to store a marker for the Event Hub pulls."
  type        = string
  default     = null
}

variable "azure_storage_secret_key" {
  description = "Access Key with permissions to access the Storage Account."
  type        = string
  default     = null
}

variable "eventhub_access_key" {
  description = "The primary key of the shared shared access policy for the namespace containing the targeted Event Hub."
  type        = string
  default     = null
}

variable "eventhub_access_policy" {
  description = "The name of the shared access policy for the namespace containing the targeted Event Hub."
  type        = string
  default     = null
}

variable "eventhub_name" {
  description = "Name of the Event Hub containing the audit logs."
  type        = string
  default     = null
}

variable "eventhub_namespace" {
  description = "Name of the Event Hub Namespace containing the Event Hub."
  type        = string
  default     = null
}

variable "format" {
  description = "The type of audit data being sent to the Event Hub. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql, Mysql_Flexible, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql."
  type        = string
  default     = "Sql"
  validation {
    condition = contains(
      [
        "AzureSQL_Managed",
        "Blob",
        "Cosmos_Mongo",
        "Cosmos_SQL",
        "Data_Explorer",
        "Databricks_Workspace",
        "File",
        "Mariadb",
        "Mysql",
        "Mysql_Flexible",
        "Postgresql",
        "Postgresql_Flexible",
        "Queue",
        "Sql",
        "Synapse",
        "Table"
      ],
      var.format
    )
    error_message = "Invalid format. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql, Mysql_Flexible, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table."
  }
}

variable "gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "parent_asset_id" {
  description = "The asset_id of the azure asset that is sending its audit logs to this AZURE EVENTHUB asset."
  type        = string
  default     = null
}

variable "reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "region" {
  description = "Azure region containing the Event Hub."
  type        = string
  default     = null
}

variable "server_host_name" {
  description = "Event Hub Namespace's service bus endpoint, e.g. mynamespace.servicebus.windows.net"
  type        = string
}
