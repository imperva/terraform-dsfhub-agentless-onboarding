variable "azure_sql_managed_instance_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "azure_sql_managed_instance_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "azure_sql_managed_instance_auth_mechanism" {
  description = "Specifies the auth mechanism used by the connection"
  type        = string
  default     = null
  validation {
    condition = (
      var.azure_sql_managed_instance_auth_mechanism == null ||
      can(contains(["password"], var.azure_sql_managed_instance_auth_mechanism))
    )
    error_message = "Invalid authentication mechanism. Supported values: password"
  }
}

variable "azure_sql_managed_instance_database_name" {
  description = "Specifies the name of the database to connect to (or default DB)."
  type        = string
  default     = "master"
}

variable "azure_sql_managed_instance_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "azure_sql_managed_instance_location" {
  description = "Physical location/region of the SQL Managed instance, e.g. \"EAST US\""
  type        = string
  default     = null
}

variable "azure_sql_managed_instance_logs_destination_asset_id" {
  description = "The asset_id of the AZURE EVENTHUB asset that this instance is sending its audit logs to."
  type        = string
  default     = null
}

variable "azure_sql_managed_instance_password" {
  description = "Password to use to connect to the SQL Managed instance."
  type        = string
  default     = null
}

variable "azure_sql_managed_instance_parent_asset_id" {
  description = "The asset_id of the AZURE asset representing the Azure account where this server is located."
  type        = string
  default     = null
}

variable "azure_sql_managed_instance_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "azure_sql_managed_instance_username" {
  description = "Username of SQL database user to connect with."
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
}

variable "managed_instance_administrator_login" {
  description = "The administrator login name for the new SQL Managed Instance. Changing this forces a new resource to be created."
  type        = string
}

variable "managed_instance_administrator_login_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's [Password Policy](https://learn.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver16&redirectedfrom=MSDN)"
  type        = string
}

variable "managed_instance_license_type" {
  description = "What type of license the Managed Instance will use. Possible values are LicenseIncluded and BasePrice. Defaults to LicenseIncluded."
  type        = string
  default     = "LicenseIncluded"
  validation {
    condition     = contains(["LicenseIncluded", "BasePrice"], var.managed_instance_license_type)
    error_message = "Invalid license type. Possible values are LicenseIncluded and BasePrice."
  }
}

variable "managed_instance_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "managed_instance_name" {
  description = "The name of the SQL Managed Instance. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "managed_instance_public_data_endpoint_enabled" {
  description = "Is the public data endpoint enabled? Default value is false."
  type        = bool
  default     = false
}

variable "managed_instance_resource_group_name" {
  description = "The name of the resource group in which to create the SQL Managed Instance. Changing this forces a new resource to be created."
  type        = string
}

variable "managed_instance_sku_name" {
  description = "Specifies the SKU Name for the SQL Managed Instance. Valid values include GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH. Defaults to GP_Gen5."
  type        = string
  default     = "GP_Gen5"
  validation {
    condition = contains(
      ["GP_Gen4", "GP_Gen5", "GP_GEN8IM", "GP_Gen8IH", "BC_Gen4", "BC_Gen5", "BC_Gen81M", "BC_Gen81H"],
      var.managed_instance_sku_name
    )
    error_message = "Invalid SKU. Valid values include GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH."
  }
}

variable "managed_instance_storage_size_in_gb" {
  description = "Maximum storage space for the SQL Managed instance. This should be a multiple of 32 (GB). Defaults to 32."
  type        = number
  default     = 32
  validation {
    condition     = var.managed_instance_storage_size_in_gb % 32 == 0
    error_message = "Invalid storage space. Must be a multiple of 32."
  }
}

variable "managed_instance_vcores" {
  description = "Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs. Defaults to 4."
  type        = number
  default     = 4
  validation {
    condition = contains(
      [4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96, 128],
      var.managed_instance_vcores
    )
    error_message = "Invalid number of cores. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs."
  }
}

variable "managed_instance_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "route_table_resource_group_name" {
  description = "The name of the resource group in which to create the network route table. Changing this forces a new resource to be created."
  type        = string
}

variable "security_group_resource_group_name" {
  description = "The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = string
}

variable "security_group_security_rules" {
  description = "List of security_rule objects representing security rules, see the [azurerm documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group#security_rule) for more details. These will be applied in addition to the default security rule settings for Managed Instances."
  type = list(
    object(
      {
        access                       = string
        description                  = optional(string)
        destination_address_prefix   = optional(string)
        destination_address_prefixes = optional(list(string))
        destination_port_range       = optional(string)
        destination_port_ranges      = optional(list(string))
        direction                    = string
        name                         = string
        priority                     = number
        protocol                     = string
        source_address_prefix        = optional(string)
        source_address_prefixes      = optional(list(string))
        source_port_range            = optional(string)
        source_port_ranges           = optional(list(string))

      }
    )
  )
  default = []
}

variable "security_group_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "virtual_network_resource_group_name" {
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "virtual_network_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}