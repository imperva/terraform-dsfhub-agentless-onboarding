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

variable "azure_cosmosdb_logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
}

variable "cosmosdb_account_capabilities" {
  description = "Configures the capabilities to be enabled for this Cosmos DB account."
  type = list(object({
    name = string
  }))
  default = [
    {
      name = "EnableTable"
  }]
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
  description = "Used to define where data should be replicated with the failover_priority 0 specifying the primary location."
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

variable "cosmosdb_account_ip_range_filter" {
  description = "A set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IPs for a given database account."
  type        = list(string)
  default     = null
  validation {
    condition = (var.cosmosdb_account_ip_range_filter == null ? true :
      alltrue([
        for ip in var.cosmosdb_account_ip_range_filter :
        can(regex("^(\\d{1,3}\\.){3}\\d{1,3}(/\\d{1,2})?$", ip))
    ]))
    error_message = "Invalid IP range filter format."
  }
}

variable "cosmosdb_account_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
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
  default     = { "defaultExperience" : "Azure Table" }
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

variable "cosmosdb_table_name" {
  description = "Specifies the name of the Cosmos DB Table. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_table_throughput" {
  description = "The throughput of Table (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply."
  type        = number
  default     = 400
  validation {
    condition     = var.cosmosdb_table_throughput % 100 == 0 && var.cosmosdb_table_throughput >= 400 && var.cosmosdb_table_throughput <= 1000000
    error_message = "Throughput must be set in increments of 100 and the minimum value is 400 and the maximum value is 1000000."
  }
}
