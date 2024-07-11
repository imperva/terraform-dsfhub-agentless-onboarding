variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "cluster_identifier" {
  description = "Identifier of AWS DocumentDB Cluster."
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "Name of the DocumentDB Cluster parameter group."
  type        = string
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
  type        = string
}

variable "deletion_protection" {
  description = "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled."
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch."
  type        = list(string)
  default     = ["audit"]
  validation {
    condition     = alltrue([for log in var.enabled_cloudwatch_logs_exports : log == "audit" || log == "profiler"])
    error_message = "Invalid value in enabled_cloudwatch_logs_exports. Allowed values are 'audit' or 'profiler'."
  }
  validation {
    condition     = length(var.enabled_cloudwatch_logs_exports) == length(distinct(var.enabled_cloudwatch_logs_exports))
    error_message = "Duplicate item in enabled_cloudwatch_logs_exports. Allowed values are 'audit' or 'profiler'. Please ensure that each log type is unique."
  }
}

variable "engine_version" {
  description = "Database engine version, e.g. \"5.0.0\""
  type        = string
  default     = "5.0.0"
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "master_password" {
  description = "Password for the master DB user."
  type        = string
}

variable "master_username" {
  description = "Master DB username."
  type        = string
  default     = "docdb"
}

variable "port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = 27017
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "storage_type" {
  description = "The storage type to associate with the DB cluster."
  type        = string
  default     = "standard"
  validation {
    condition     = can(regex("^(iopt1|standard)$", var.storage_type))
    error_message = "Invalid value for storage_type. Allowed values are 'iopt1' or 'standard'."
  }
}

variable "tags" {
  description = "A map of tags to assign to the DB cluster."
  type        = map(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
}
