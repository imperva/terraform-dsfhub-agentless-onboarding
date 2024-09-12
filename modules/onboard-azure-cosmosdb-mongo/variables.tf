variable "azure_cosmosdb_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "azure_cosmosdb_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_cosmosdb_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_eventhub_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_eventhub_asset_display_name" {
  description = "User-friendly name of the asset, defined by user"
  type        = string
}

variable "azure_eventhub_asset_id" {
  description = "The Azure resource ID of the Event Hub."
  type        = string
}

variable "azure_eventhub_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_eventhub_azure_storage_account" {
  description = "Name of the Azure Storage Account that will be used to store a marker for the Event Hub pulls."
  type        = string
  default     = null
}

variable "azure_eventhub_azure_storage_container" {
  description = "Name of the Azure Storage Container that will be used to store a marker for the Event Hub pulls."
  type        = string
  default     = null
}

variable "azure_eventhub_azure_storage_secret_key" {
  description = "Access Key with permissions to access the Storage Account."
  type        = string
  default     = null
}

variable "azure_eventhub_eventhub_access_key" {
  description = "The primary key of the shared shared access policy for the namespace containing the targeted Event Hub."
  type        = string
  default     = null
}

variable "azure_eventhub_eventhub_access_policy" {
  description = "The name of the shared access policy for the namespace containing the targeted Event Hub."
  type        = string
  default     = null
}

variable "azure_eventhub_eventhub_name" {
  description = "Name of the Event Hub containing the audit logs."
  type        = string
  default     = null
}

variable "azure_eventhub_eventhub_namespace" {
  description = "Name of the Event Hub Namespace containing the Event Hub."
  type        = string
  default     = null
}

variable "azure_eventhub_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_eventhub_parent_asset_id" {
  description = "The asset_id of the azure asset that is sending its audit logs to this AZURE EVENTHUB asset."
  type        = string
  default     = null
}

variable "azure_eventhub_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "azure_eventhub_region" {
  description = "Azure region containing the Event Hub."
  type        = string
  default     = null
}

variable "cosmosdb_account_capabilities" {
  description = "Configures the capabilities to be enabled for this Cosmos DB account."
  type = list(object({
    name = string
  }))
  default = null
}

variable "cosmosdb_account_consistency_policy" {
  description = "Block defining the database consistency level. See the [Azure documentation](https://learn.microsoft.com/en-us/azure/cosmos-db/consistency-levels) for more information."
  type = list(
    object(
      {
        consistency_level       = string
        max_interval_in_seconds = optional(number, 5)
        max_staleness_prefix    = optional(number)
      }
    )
  )
  default = [
    {
      consistency_level = "Session"
    }
  ]
}

variable "cosmosdb_account_geo_location" {
  description = "value"
  type = list(
    object(
      {
        location          = string
        failover_priority = number
        zone_redundant    = optional(bool, false)
      }
    )
  )
  default = [
    {
      location          = "eastus"
      failover_priority = 0
      zone_redundant    = false
    }
  ]
}

variable "cosmosdb_account_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_account_mongo_server_version" {
  description = "The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2."
  type        = string
  default     = "4.2"
  validation {
    condition     = contains(["4.2", "4.0", "3.6", "3.2"], var.cosmosdb_account_mongo_server_version)
    error_message = "Invalid MongoDB server version. Possible values are 4.2, 4.0, 3.6, and 3.2."
  }
}

variable "cosmosdb_account_name" {
  description = "Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_account_resource_group_name" {
  description = "The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_account_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "diagnostic_setting_eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. "
  type        = string
}

variable "diagnostic_setting_eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
}

variable "diagnostic_setting_name" {
  description = "Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created."
  type        = string
}

variable "diagnostic_setting_storage_account_id" {
  description = "The ID of the Storage Account where logs should be sent. "
  type        = string
  default     = null
}
