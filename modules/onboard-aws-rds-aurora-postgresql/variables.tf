variable "aws_aurora_postgresql_cluster_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_aurora_postgresql_cluster_audit_type" {
  description = "Used to indicate what mechanism should be used to fetch logs on systems supporting multiple ways to get logs, see asset specific documentation for details"
  type        = string
  default     = "LOG_GROUP"
  validation {
    condition     = contains(["LOG_GROUP", "AGGREGATED"], var.aws_aurora_postgresql_cluster_audit_type)
    error_message = "Invalid Value. Select from LOG_GROUP, or AGGREGATED."
  }
}

variable "aws_aurora_postgresql_cluster_parent_asset_id" {
  description = "The asset_id of the cloud account with auth-mech such as key-pair, iam-role etc."
  type        = string
}

variable "aws_aurora_postgresql_cluster_region" {
  description = "AWS region containing the cluster."
  type        = string
  default     = null
}

variable "aws_aurora_postgresql_cluster_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_log_group_admin_email" {
  description = "The email address to notify about the asset."
  type        = string
}

variable "aws_log_group_audit_pull_enabled" {
  description = "If true, sonargateway will collect the audit logs for this system if it can."
  type        = bool
  default     = false
}

variable "aws_log_group_gateway_id" {
  description = "The jsonarUid unique identifier of the agentless gateway. Example: '7a4af7cf-4292-89d9-46ec-183756ksdjd'."
  type        = string
}

variable "aws_log_group_reason" {
  description = "Used to differentiate connections that belong to the same asset"
  type        = string
  default     = "default"
}

variable "aws_log_group_region" {
  description = "AWS region of the log group"
  type        = string
}

variable "cluster_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = null
}

variable "cluster_backup_retention_period" {
  description = "Days to retain backups for."
  type        = number
  default     = null
}

variable "cluster_identifier" {
  description = "The name of the RDS cluster"
  type        = string
}

variable "cluster_db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
  default     = null
}

variable "cluster_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. Valid values: audit, error, general, slowquery."
  type        = list(any)
  default     = ["postgresql"]
}

variable "cluster_engine_version" {
  description = "Database engine version, e.g., 16.1"
  type        = string
  default     = "16.1"
}

variable "cluster_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "cluster_master_username" {
  description = "Username for the master DB user."
  type        = string
  validation {
    condition = (
      var.cluster_master_username != "rdsadmin" &&
      var.cluster_master_username != "admin"
    )
    error_message = "The aurora cluster master username must not be either \"rdsadmin\" or \"admin\". Please select another value."
  }
}

variable "cluster_network_type" {
  description = " Network type of the cluster. Valid values: IPV4, DUAL"
  type        = string
  default     = null
}

variable "cluster_port" {
  description = "Port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "cluster_preferred_maintenance_window" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "cluster_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. If false is specified, a DB snapshot is created before the DB cluster is deleted, using the value from final_snapshot_identifier. Default is true."
  type        = bool
  default     = true
}

variable "cluster_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(any)
  default     = null
}

variable "cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group"
  type        = string
}

variable "cluster_parameter_group_family" {
  description = "The family of the DB cluster parameter group."
  type        = string
  default     = "aurora-postgresql16"
}

variable "cluster_parameter_group_description" {
  description = "The description of the DB cluster parameter group."
  type        = string
  default     = null
}

variable "cluster_parameter_group_parameters" {
  description = "List of objects containing parameters for the DB cluster parameter group."
  type = list(
    object({
      name         = string
      apply_method = optional(string, "immediate")
      value        = any
    })
  )
  default = [
    {
      name  = "log_connections"
      value = 1
    },
    {
      name  = "log_disconnections"
      value = 1
    },
    {
      name  = "log_error_verbosity"
      value = "verbose"
    },
    {
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name  = "pgaudit.role"
      value = "rds_pgaudit"
    },
    {
      name         = "shared_preload_libraries"
      value        = "pgaudit,pg_stat_statements"
      apply_method = "pending-reboot"
    }
  ]
}

variable "cluster_parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "instance_identifier" {
  description = "The name of the Aurora PostgreSQL cluster instance"
  type        = string
}

variable "instance_publicly_accessible" {
  description = "If instance is publicly accessible. Default false"
  type        = bool
  default     = null
}

variable "instance_db_instance_class" {
  description = "The instance type of the RDS cluster. Example: 'db.t3.micro'"
  type        = string
  default     = "db.t3.medium"
}

variable "instance_maintenance_schedule" {
  description = "Weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
  default     = null
}

variable "instance_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = null
}

variable "instance_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = null
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}
