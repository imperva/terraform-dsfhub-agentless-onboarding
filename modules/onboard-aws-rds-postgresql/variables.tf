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

variable "aws_rds_postgresql_admin_email" {
  description = "The email address to notify about this asset"
  type        = string
}

variable "aws_rds_postgresql_audit_type" {
  description = "Determines what mapping/gateway service will handle the asset."
  type        = string
  default     = "LOG_GROUP"
  validation {
    condition     = contains(["LOG_GROUP", "AGGREGATED", "TABLE"], var.aws_rds_postgresql_audit_type)
    error_message = "Invalid Value. Select from LOG_GROUP, AGGREGATED, or TABLE."
  }
}

variable "aws_rds_postgresql_gateway_id" {
  description = "Unique identifier (UID) attached to the jSonar machine controlling the asset"
  type        = string
}

variable "aws_rds_postgresql_parent_asset_id" {
  description = "The asset_id that contains this asset (e.g. Asset ID of the database sending audit events)"
  type        = string
}

variable "aws_rds_postgresql_region" {
  description = "AWS region containing the instance."
  type        = string
}


variable "parameter_group_description" {
  description = "parameter group description"
  type        = string
  default     = null
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group. For example, 'oracle-ee', 'postgres', etc."
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group."
  type        = string
}

variable "parameter_group_parameters" {
  description = "List of objects containing parameters for the DB parameter group."
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
      name  = "pgaudit.role"
      value = "rds_pgaudit"
    },
    {
      name  = "pgaudit.log"
      value = "all"
    },
    {
      name         = "shared_preload_libraries"
      value        = "pgaudit"
      apply_method = "pending-reboot"
    },
  ]
}

variable "parameter_group_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "instance_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  type        = number
  default     = 20
}

variable "instance_apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = true
}

variable "instance_db_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
  default     = "testdb"
}

variable "instance_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
}

variable "instance_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "instance_enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = ["postgresql"]
  validation {
    condition     = alltrue([for log in var.instance_enabled_cloudwatch_logs_exports : log == "postgresql" || log == "upgrade"])
    error_message = "Invalid value in instance_enabled_cloudwatch_logs_exports. Allowed values are (postgresql, upgrade)."
  }
  validation {
    condition     = length(var.instance_enabled_cloudwatch_logs_exports) == length(distinct(var.instance_enabled_cloudwatch_logs_exports))
    error_message = "Duplicate item in instance_enabled_cloudwatch_logs_exports. Allowed values are 'postgresql' or 'upgrade'. Please ensure that each log type is unique."
  }
}

variable "instance_engine_version" {
  description = "Database engine version, e.g. \"8.0\""
  type        = string
  default     = null
}

variable "instance_final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}

variable "instance_identifier" {
  description = "Identifier of RDS instance"
  type        = string
  default     = "rds-mysql"
}

variable "instance_instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t3.small"
}

variable "instance_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage."
  type        = number
  default     = null
}

variable "instance_option_group_name" {
  description = "Name of the option group to associate with the RDS instance."
  type        = string
  default     = null
}

variable "instance_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "instance_port" {
  description = "The port on which the DB accepts connections."
  type        = string
  default     = null
}

variable "instance_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = true
}

variable "instance_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier."
  type        = bool
  default     = true
}

variable "instance_tags" {
  description = "A map of tags to assign to the RDS instance."
  type        = map(string)
  default     = null
}

variable "instance_username" {
  description = "Username for the master DB user."
  type        = string
  default     = "admin"
}

variable "instance_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
  default     = null
}

variable "log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. If you select 0, the events in the log group are always retained and never expire."
  type        = number
  default     = 7
}
