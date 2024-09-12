variable "capabilities" {
  description = "Configures the capabilities to be enabled for this Cosmos DB account."
  type = list(object({
    name = string
  }))
  default = null
}

variable "consistency_policy" {
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

variable "geo_location" {
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

variable "kind" {
  description = "Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB (used for both SQL and Table API) and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."
  type        = string
  default     = "GlobalDocumentDB"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "mongo_server_version" {
  description = "The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2."
  type        = string
  default     = null
  validation {
    condition = (
      var.mongo_server_version == null ? true :
      contains(["4.2", "4.0", "3.6", "3.2"], var.mongo_server_version)
    )
    error_message = "Invalid MongoDB server version. Possible values are 4.2, 4.0, 3.6, and 3.2."
  }
}

variable "name" {
  description = "Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}
