variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is true"
  type        = bool
  default     = null
}

variable "backup_retention" {
  description = "Days to retain backups for, Default is 1 day."
  type        = number
  default     = null
}

variable "cluster_id" {
  description = "The name of the RDS cluster"
  type        = string
}

variable "db_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery."
  type        = list(any)
  default     = null
}

variable "db_engine" {
  description = "Cluster engine e.g., aurora-mysql"
  type        = string
  default     = null
}
variable "db_engine_version" {
  description = "Database engine version, e.g., 8.0.mysql_aurora.3.05.1"
  type        = string
  default     = null
}

variable "db_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Cannot be set if manage_master_user_password is set to true"
  type        = string
}

variable "db_master_username" {
  description = "Username for the master DB user, must not use rdsadmin as that is reserved."
  type        = string
}

variable "db_port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}

variable "final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is false"
  type        = bool
  default     = null
}

variable "maintenance_schedule" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "network_type" {
  description = " Network type of the cluster. Valid values: IPV4, DUAL"
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "Cluster parameter group associated with the cluster"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(any)
  default     = null
}
