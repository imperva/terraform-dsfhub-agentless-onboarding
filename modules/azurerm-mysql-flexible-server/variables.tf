variable "administrator_login" {
  description = "The Administrator login for the MySQL Flexible Server."
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the MySQL Flexible Server."
  type        = string
}

variable "location" {
  description = "The Azure Region where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "name" {
  description = "The name which should be used for this MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the MySQL Flexible Server should exist. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
}

variable "public_network_access" {
  description = "Whether approved public traffic is allowed through the firewall to this MySQL Flexible Server. Possible values are Enabled and Disabled."
  type        = string
  validation {
    condition     = contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "Invalid value for public_network_access. Possible values are Enabled and Disabled."
  }
}

variable "sku_name" {
  description = "The SKU Name for the MySQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3). Defaults to GP_Standard_D2s_v3."
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "mysql_version" {
  description = "The version of the MySQL Flexible Server to use. Possible values are 5.7, and 8.0.21."
  type        = string
  default     = null
  validation {
    condition     = contains(["5.7", "8.0.21"], var.mysql_version)
    error_message = "Invalid MySQL version. Possible values are 5.7, 8.0.21"
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the MySQL Flexible Server."
  type        = map(string)
  default     = {}
}

variable "storage_auto_grow_enabled" {
  description = "Specifies whether auto grow is enabled for the MySQL Flexible Server. Defaults to true."
  type        = bool
  default     = true
}

variable "storage_io_scaling_enabled" {
  description = "Specifies whether IO scaling is enabled for the MySQL Flexible Server. Defaults to true."
  type        = bool
  default     = true
}

variable "storage_iops" {
  description = "The number of IOPS for the MySQL Flexible Server. Possible Values are between 360 to 20000."
  type        = number
  validation {
    condition     = var.storage_iops == null || (var.storage_iops >= 360 && var.storage_iops <= 20000)
    error_message = "Invalid value for azure_mysql_flexible_iops. Possible values are between 360 to 20000."
  }
}

variable "storage_log_on_disk_enabled" {
  description = "Specifies whether storage log on disk is enabled for the MySQL Flexible Server. Defaults to false."
  type        = bool
  default     = false
}

variable "storage_size_gb" {
  description = "The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384."
  type        = number
  validation {
    condition     = var.storage_size_gb == null || (var.storage_size_gb >= 20 && var.storage_size_gb <= 16384)
    error_message = "Invalid value for azure_mysql_flexible_size_gb. Possible values are between 20 and 16384."
  }
}
