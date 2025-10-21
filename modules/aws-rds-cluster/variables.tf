variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = null
}

variable "backup_retention_period" {
  description = "Days to retain backups for."
  type        = number
  default     = null
}

variable "cluster_identifier" {
  description = "The cluster identifier."
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "A cluster parameter group to associate with the cluster."
  type        = string
  default     = null
}

variable "db_subnet_group_name" {
  description = "DB subnet group to associate with this DB cluster. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, error, general, slowquery, postgresql (PostgreSQL)."
  type        = list(string)
  default     = null
}

variable "engine" {
  description = "Name of the database engine to be used for this DB cluster. Valid Values: aurora-mysql, aurora-postgresql, mysql, postgres. (Note that mysql and postgres are Multi-AZ RDS clusters)."
  type        = string
  default     = null
}

variable "engine_mode" {
  description = "Database engine mode. Valid values: global (only valid for Aurora MySQL 1.21 and earlier), parallelquery, provisioned, serverless. Defaults to: provisioned. Specify an empty string for no engine mode. See the [RDS User Guide](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html) for limitations when using serverless. Default is provisioned."
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "Database engine version, e.g., 8.0.mysql_aurora.3.05.1"
  type        = string
  default     = null
}

variable "master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "master_username" {
  description = "Username for the master DB user, must not use rdsadmin as that is reserved."
  type        = string
}

variable "network_type" {
  description = " Network type of the cluster. Valid values: IPV4, DUAL"
  type        = string
  default     = null
}

variable "port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "preferred_maintenance_window" {
  description = "Weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30."
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier."
  type        = bool
  default     = null
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is false for provisioned engine_mode and true for serverless engine_mode. When restoring an unencrypted snapshot_identifier, the kms_key_id argument must be provided to encrypt the restored cluster. Terraform will only perform drift detection if a configuration value is provided. Default is true."
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the cluster."
  type        = list(any)
  default     = null
}
