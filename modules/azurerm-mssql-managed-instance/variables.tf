variable "administrator_login" {
  description = "The administrator login name for the new SQL Managed Instance. Changing this forces a new resource to be created."
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's [Password Policy](https://learn.microsoft.com/en-us/sql/relational-databases/security/password-policy?view=sql-server-ver16&redirectedfrom=MSDN)"
  type        = string
}

variable "license_type" {
  description = "What type of license the Managed Instance will use. Possible values are LicenseIncluded and BasePrice. Defaults to LicenseIncluded."
  type        = string
  default     = "LicenseIncluded"
  validation {
    condition     = contains(["LicenseIncluded", "BasePrice"], var.license_type)
    error_message = "Invalid license type. Possible values are LicenseIncluded and BasePrice."
  }
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the SQL Managed Instance. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "public_data_endpoint_enabled" {
  description = "Is the public data endpoint enabled? Default value is false."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Managed Instance. Changing this forces a new resource to be created."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for the SQL Managed Instance. Valid values include GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH. Defaults to GP_Gen5."
  type        = string
  default     = "GP_Gen5"
  validation {
    condition = contains(
      ["GP_Gen4", "GP_Gen5", "GP_GEN8IM", "GP_Gen8IH", "BC_Gen4", "BC_Gen5", "BC_Gen81M", "BC_Gen81H"],
      var.sku_name
    )
    error_message = "Invalid SKU. Valid values include GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH."
  }
}

variable "storage_size_in_gb" {
  description = "Maximum storage space for the SQL Managed instance. This should be a multiple of 32 (GB). Defaults to 32."
  type        = number
  default     = 32
  validation {
    condition     = var.storage_size_in_gb % 32 == 0
    error_message = "Invalid storage space. Must be a multiple of 32."
  }
}

variable "subnet_id" {
  description = "The subnet resource id that the SQL Managed Instance will be associated with. Changing this forces a new resource to be created."
  type        = string
}

variable "vcores" {
  description = "Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs. Defaults to 4."
  type        = number
  default     = 4
  validation {
    condition = contains(
      [4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96, 128],
      var.vcores
    )
    error_message = "Invalid number of cores. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
