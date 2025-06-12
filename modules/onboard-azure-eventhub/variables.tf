variable "azure_eventhub_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_eventhub_format" {
  description = "The type of audit data being sent to the Event Hub. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Cosmos_Table, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table. Defaults to Sql."
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
        "Postgresql",
        "Postgresql_Flexible",
        "Queue",
        "Sql",
        "Synapse",
        "Table"
      ],
      var.azure_eventhub_format
    )
    error_message = "Invalid format. Possible values are: AzureSQL_Managed, Blob, Cosmos_Mongo, Cosmos_SQL, Cosmos_Table, Data_Explorer, Databricks_Workspace, File, Mariadb, Mysql, Postgresql, Postgresql_Flexible, Queue, Sql, Synapse, Table."
  }
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

variable "azure_eventhub_region" {
  description = "Azure region containing the Event Hub."
  type        = string
  default     = null
}

variable "eventhub_message_retention" {
  description = "Specifies the number of days to retain the events for this Event Hub. Maximum value is 7 days. Defaults to 1."
  type        = number
  default     = 1
  validation {
    condition     = var.eventhub_message_retention <= 7
    error_message = "Maximum Event Hub message retention is 7 days."
  }
}

variable "eventhub_name" {
  description = "Specifies the name of the Event Hub resource. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_partition_count" {
  description = "Specifies the current number of shards on the Event Hub. Note: partition_count cannot be changed unless Eventhub Namespace SKU is Premium and cannot be decreased. Maximum value is 32. Defaults to 1."
  type        = number
  default     = 1
  validation {
    condition     = var.eventhub_partition_count <= 32
    error_message = "Maximum Event Hub partition count is 32."
  }
}

variable "eventhub_resource_group_name" {
  description = "The name of the resource group in which the Event Hub's parent Namespace exists. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_status" {
  description = "Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active."
  type        = string
  default     = "Active"
  validation {
    condition     = contains(["Active", "Disabled", "SendDisabled"], var.eventhub_status)
    error_message = "Invalid sku. Possible values are Active, Disabled and SendDisabled."
  }
}

variable "eventhub_namespace_capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Defaults to 1."
  type        = number
  default     = 1
}

variable "eventhub_namespace_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_namespace_name" {
  description = "Specifies the name of the Event Hub Namespace resource. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_namespace_public_network_access_enabled" {
  description = "Is public network access enabled for the Event Hub Namespace? Defaults to true."
  type        = bool
  default     = true
}

variable "eventhub_namespace_resource_group_name" {
  description = "The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}

variable "eventhub_namespace_sku" {
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource. Defaults to Basic."
  type        = string
  default     = "Basic"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.eventhub_namespace_sku)
    error_message = "Invalid sku. Valid options are Basic, Standard, and Premium."
  }
}

variable "eventhub_namespace_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "storage_account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. Defaults to GRS."
  type        = string
  default     = "GRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.storage_account_replication_type)
    error_message = "Invalid replication type. Valid values are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  }
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "Invalid replication type. Valid options are Standard and Premium."
  }
}

variable "storage_account_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.storage_account_name)) && length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "Invalid name. Storage account name must consist of lowercase Alphanumeric characters and be between 3 amd 24 characters long."
  }
}

variable "storage_account_resource_group_name" {
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
}

variable "storage_container_name" {
  description = "The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
  type        = string
}
