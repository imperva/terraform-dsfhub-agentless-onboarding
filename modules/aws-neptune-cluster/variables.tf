variable "identifier" {
  description = "The cluster identifier"
  type        = string
  default     = null
}

variable "engine" {
  description = "The name of the database engine to be used for this Neptune cluster."
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The database engine version."
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for. Default is 1"
  type        = number
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = null
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. "
  type        = bool
  default     = null
}

variable "enable_cloudwatch_logs_exports" {
  description = "A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit and slowquery"
  type        = list(string)
  default     = null
}

variable "parameter_group_name" {
  description = "cluster parameter group to associate with the cluster"
  type        = string
  default     = null
}

variable "iam_database_authentication_enabled" {
  description = " Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = null
}

variable "storage_type" {
  description = "Storage type associated with the cluster standard/iopt1. Default: standard"
  type        = string
  default     = null
}

variable "preferred_maintenance_window" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
  default     = null
}

variable "neptune_subnet_group_name" {
  description = "A subnet group to associate with this neptune instance."
  type        = string
  default     = null
}