variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Flexible Server."
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Flexible Server."
  type        = string
}

variable "location" {
  description = "The Azure Region where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "name" {
  description = "The name which should be used for this PostgreSQL Flexible Server. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "postgres_version" {
  description = "The version of PostgreSQL Flexible Server to use. Possible values are 11, 12, 13, 14, 15 and 16. Defaults to 16."
  type        = number
  default     = 16
  validation {
    condition     = contains([11, 12, 13, 14, 15, 16], var.postgres_version)
    error_message = "Invalid PostgreSQL version. Possible values are 11, 12, 13, 14, 15 and 16."
  }
}

variable "public_network_access_enabled" {
  description = "Specifies whether this PostgreSQL Flexible Server is publicly accessible. Defaults to true."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the PostgreSQL Flexible Server should exist. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
}

variable "sku_name" {
  description = "The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)."
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
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
    var.storage_mb)
    error_message = "Invalid value for storage_mb. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408"
  }
}

variable "storage_tier" {
  description = "The name of storage performance tier for IOPS of the PostgreSQL Flexible Server. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80. Default value is dependant on the storage_mb value. Please see the storage_tier defaults based on storage_mb table [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#storage_tier-defaults-based-on-storage_mb)."
  type        = string
  default     = null
  validation {
    condition = (
      var.storage_tier == null ||
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
          var.storage_tier
        )
      )
    )
    error_message = "Invalid value for storage_tier. Possible values are P4, P6, P10, P15,P20, P30,P40, P50,P60, P70 or P80."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
