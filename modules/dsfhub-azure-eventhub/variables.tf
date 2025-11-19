variable "admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "application_id" {
  description = "Also referred to as the Client ID this is the unique identifier for the registered application being used to execute Python SDK commands against Azure’s API services. You can find this number under Azure Active Directory -> App Registrations -> Owned Applications. Required when using client_secret auth mechanism."
  type        = string
  default     = null
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
  description = "Specifies the auth mechanism used by the connection. Possible values are: default, client_secret, or azure_ad."
  type        = string
  default     = null
  validation {
    condition     = var.auth_mechanism == null || contains(["default", "client_secret", "azure_ad"], var.auth_mechanism)
    error_message = "Invalid auth_mechanism. Possible values are: default, client_secret, or azure_ad."
  }
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

variable "client_secret" {
  description = "This a string containing a secret used by the application to prove its identity when requesting a token. You can get a secret by going to Azure Active Directory -> App Registrations -> Owned Applications, selecting the desired application and then going to Certificates & secrets -> Client secrets -> + New client secret. Required when using client_secret auth mechanism."
  type        = string
  default     = null
}

variable "directory_id" {
  description = "Also referred to as the Tenant ID and is a GUID representing the Active Directory Tenant. It can be found in the Azure Active Directory page under the Azure portal. Required when using client_secret auth mechanism."
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
  description = "The type of audit data being sent to the Event Hub. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Cosmos_Table, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql,  Mysql_Flexible, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql."
  type        = string
  default     = "Sql"
  validation {
    condition = contains(
      [
        "AzureSQL_Managed",
        "Blob",
        "Cosmos_Mongo",
        "Cosmos_SQL",
        "Cosmos_Table",
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
    error_message = "Invalid format. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Cosmos_Table, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql, Mysql_Flexible, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table."
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

variable "subscription_id" {
  description = "This is the Azure account subscription ID. You can find this number under the Subscriptions page on the Azure portal. Required when using client_secret auth mechanism."
  type        = string
  default     = null
}

variable "user_identity_client_id" {
  description = "The client ID of a user-assigned managed identity. Defaults to the value of the environment variable AZURE_CLIENT_ID, if any. If not specified, a system-assigned identity will be used."
  type        = string
  default     = null
}
